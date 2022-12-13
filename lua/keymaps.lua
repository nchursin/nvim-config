local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('', 'j', 'gj', { noremap = false })
map('', 'k', 'gk', { noremap = false })

-- various UX shortcuts
-- terminal
map('n', '<leader><C-t>', '<C-w>s<C-w>j:term<CR>', default_opts)
-- exit i mode in terminal
map('t', '<C-o>', '<C-\\><C-n>', { noremap = false })

-- " clear search highlights
map('n', '<leader>/', ':noh<CR>', default_opts)
-- " source %
map('n', '<leader><C-s>', ':source %<CR>', default_opts)
-- " reload current file
map('n', '<leader><C-r>', ':edit!<CR>', default_opts)
-- " open current file in new tab (e.g. for copy mode)
map('n', '<leader>tt', ':tabe %<CR>', default_opts)
map('n', '<F3>', ':Reload<CR>', default_opts)
map('n', '<F4>', ':tabe ~/.config/nvim/<CR>', default_opts)
-- " switch between relative and absolute line numbers
map('n', '<C-n><C-n>', ':set relativenumber!<CR>', default_opts)

-- dap
map('n', '<leader>dd', "<cmd> lua require'dap'.continue() <CR>", default_opts)
map('n', '<leader>db', "<cmd> lua require'dap'.toggle_breakpoint() <CR>", default_opts)
map('n', '<leader>do', "<cmd> lua require'dap'.step_over() <CR>", default_opts)
map('n', '<leader>di', "<cmd> lua require'dap'.step_into() <CR>", default_opts)
map('n', '<leader>dr', "<cmd> lua require'dap'.repl.open() <CR>", default_opts)

