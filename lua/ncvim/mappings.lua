local silent_nooremap = { noremap = true, silent = true }

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
    options = silent_nooremap,
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
    options = silent_nooremap,
  },
  -- " source %
  {
    mode = 'n',
    key_string = '<leader><C-s>',
    command = ':source %<CR>',
    options = silent_nooremap,
  },
  -- " reload current file
  {
    mode = 'n',
    key_string = '<leader><C-r>',
    command = ':edit!<CR>',
    options = silent_nooremap,
  },
  -- " open current file in new tab (e.g. for copy mode)
  {
    mode = 'n',
    key_string = '<leader>tt',
    command = ':tabe %<CR>',
    options = silent_nooremap,
  },
  -- " switch between relative and absolute line numbers
  {
    mode = 'n',
    key_string = '<C-n><C-n>',
    command = ':set relativenumber!<CR>',
    options = silent_nooremap,
  },
}
