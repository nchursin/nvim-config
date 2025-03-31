local silent_noremap = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- treat long lines as multiple lines
ncvim.add_mappings {
  {
    mode = 'n',
    key_string = '<leader>jp',
    options = { noremap = false },
    command = '%!python3 -m json.tool --no-ensure-ascii<CR>',
    desc = "prettify json",
  },
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
    options = silent_noremap,
    desc = "remove highlightning (e.g. search results)",
  },
  -- " source %
  {
    mode = 'n',
    key_string = '<leader><C-s>',
    command = ':source %<CR>',
    options = silent_noremap,
    desc = "source current buffer",
  },
  -- " reload current file
  {
    mode = 'n',
    key_string = '<leader><C-r>',
    command = ':edit!<CR>',
    options = silent_noremap,
    desc = "reload current buffer",
  },
  -- " open current file in new tab (e.g. for copy mode)
  {
    mode = 'n',
    key_string = '<leader>tt',
    command = ':tabe %<CR>',
    options = silent_noremap,
    desc = "open current buffer in new tab",
  },
  -- " switch between relative and absolute line numbers
  {
    mode = 'n',
    key_string = '<C-n><C-n>',
    command = ':set relativenumber!<CR>',
    options = silent_noremap,
    desc = "toggle relative number",
  },

  {
    mode = 'n',
    key_string = 'gd',
    command = ncvim.lsp.definitions,
    options = silent_noremap,
    desc = "go to definitions",
  },
  {
    mode = 'n',
    key_string = 'gsd',
    command = '<C-w>v<cmd> lua ncvim.lsp.definitions()<CR>',
    options = silent_noremap,
    desc = "split definitions to the left",
  },
  {
    mode = 'n',
    key_string = 'gSd',
    command = '<C-w>s<cmd> lua ncvim.lsp.definitions()<CR>',
    options = silent_noremap,
    desc = "split definitions to the bottom",
  },
  {
    mode = 'n',
    key_string = 'gD',
    command = ncvim.lsp.declaration,
    options = silent_noremap,
    desc = "go to declaration",
  },
  {
    mode = 'n',
    key_string = 'gsD',
    command = '<C-w>v<cmd> lua ncvim.lsp.declaration()<CR>',
    options = silent_noremap,
    desc = "split declarations to the left",
  },
  {
    mode = {
      'n',
      'i',
    },
    key_string = '<C-k>',
    command = ncvim.lsp.signature_help,
    options = silent_noremap,
    desc = "display signature help",
  },
  {
    mode = 'n',
    key_string = 'gi',
    command = ncvim.lsp.implementations,
    options = silent_noremap,
    desc = "go to implementations",
  },
  {
    mode = 'n',
    key_string = 'gsi',
    command = '<C-w>v<cmd> lua ncvim.lsp.implementations()<CR>',
    options = silent_noremap,
    desc = "split implementations to the left",
  },
  {
    mode = 'n',
    key_string = 'gSi',
    command = '<C-w>s<cmd> lua ncvim.lsp.implementations()<CR>',
    options = silent_noremap,
    desc = "split implementations to the bottom",
  },
  {
    mode = 'n',
    key_string = 'gr',
    command = ncvim.lsp.references,
    options = silent_noremap,
    desc = "go to references",
  },
  {
    mode = 'n',
    key_string = 'gsr',
    command = '<C-w>v<cmd> lua ncvim.lsp.references()<CR>',
    options = silent_noremap,
    desc = "split references to the left",
  },
  {
    mode = 'n',
    key_string = 'gSr',
    command = '<C-w>s<cmd> lua ncvim.lsp.references()<CR>',
    options = silent_noremap,
    desc = "split references to the bottom",
  },
}
