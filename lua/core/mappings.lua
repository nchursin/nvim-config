local default_opts = require('utils.mappings_utils').default_opts

vim.g.mapleader = ' '

-- treat long lines as multiple lines
ncvim.add_mappings {
  {
    mode = '',
    key_string = 'j',
    command = 'gj',
    options = { noremap = false },
  },
  {
    mode = '',
    key_string = 'k',
    command = 'gk',
    options = { noremap = false },
  },

  -- various UX shortcuts
  -- terminal
  {
    mode = 'n',
    key_string = '<leader><C-t>',
    command = ':split<CR><C-w>j:term<CR>',
    options = default_opts,
  },
  -- exit i mode in terminal
  {
    mode = 't',
    key_string = '<C-o>',
    command = '<C-\\><C-n>',
    options = { noremap = false },
  },

  -- " clear search highlights
  {
    mode = 'n',
    key_string = '<leader>/',
    command = ':noh<CR>',
    options = default_opts,
  },
  -- " source %
  {
    mode = 'n',
    key_string = '<leader><C-s>',
    command = ':source %<CR>',
    options = default_opts,
  },
  -- " reload current file
  {
    mode = 'n',
    key_string = '<leader><C-r>',
    command = ':edit!<CR>',
    options = default_opts,
  },
  -- " open current file in new tab (e.g. for copy mode)
  {
    mode = 'n',
    key_string = '<leader>tt',
    command = ':tabe %<CR>',
    options = default_opts,
  },
  -- " switch between relative and absolute line numbers
  {
    mode = 'n',
    key_string = '<C-n><C-n>',
    command = ':set relativenumber!<CR>',
    options = default_opts,
  },
}
