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


-- NerdTREE nerdtree
map('n', '<leader>n', ':NERDTreeFocus<CR>', default_opts)
map('n', '<C-n>', ':NERDTreeFocus<CR>', default_opts)
map('n', '<leader><C-n>', ':NERDTree<CR>', default_opts)
map('n', '<C-t>', ':NERDTreeToggle<CR>', default_opts)
map('n', '<C-f>', ':NERDTreeFind<CR>', default_opts)


-- " prettier
map('n', '<Leader>pp', '<Plug>(Prettier)', { noremap = false })

-- telescope
map('n', '<C-p>', '<cmd>Telescope find_files<cr>', default_opts)
map('n', '<leader>ff', '<cmd>Telescope live_grep<cr>', default_opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', default_opts)
-- map( 'n', '<leader>fh', '<cmd>Telescope help_tags<cr>', default_opts )

-- vim-prettier
map('n', '<Leader>pp', '<Plug>(Prettier)', { noremap = false })

-- vim-test
map('n', 't<C-n>', ':TestNearest<CR>', { noremap = false })
map('n', 't<C-f>', ':TestFile<CR>', { noremap = false })
map('n', 't<C-s>', ':TestSuite<CR>', { noremap = false })
map('n', 't<C-l>', ':TestLast<CR>', { noremap = false })
map('n', 't<C-g>', ':TestVisit<CR>', { noremap = false })
map('n', 'tcjw', ':let g:test#javascript#runner=\'webdriverio\'<CR>', { noremap = false })
map('n', 'tcjm', ':let g:test#javascript#runner=\'mocha\'<CR>', { noremap = false })
map('n', 'tcjj', ':let g:test#javascript#runner=\'jest\'<CR>', { noremap = false })
map('n', 'tsj', ':echo g:test#javascript#runner<CR>', { noremap = false })

-- dap
map('n', '<leader>dd', "<cmd> lua require'dap'.continue() <CR>", default_opts)
map('n', '<leader>db', "<cmd> lua require'dap'.toggle_breakpoint() <CR>", default_opts)
map('n', '<leader>do', "<cmd> lua require'dap'.step_over() <CR>", default_opts)
map('n', '<leader>di', "<cmd> lua require'dap'.step_into() <CR>", default_opts)
map('n', '<leader>dr', "<cmd> lua require'dap'.repl.open() <CR>", default_opts)

-- easymotion
map ('n', '<leader>f', '<Plug>(easymotion-overwin-f)', default_opts )
map ('n', '<leader>s', '<Plug>(easymotion-overwin-f2)', default_opts )
map ('n', '<leader>w', '<Plug>(easymotion-overwin-w)', default_opts )
