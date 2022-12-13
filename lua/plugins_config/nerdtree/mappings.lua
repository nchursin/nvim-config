local mappings_utils = require('utils.mappings_utils')
local map = mappings_utils.map
local default_opts = mappings_utils.default_opts

-- NerdTREE nerdtree
map('n', '<leader>n', ':NERDTreeFocus<CR>', default_opts)
map('n', '<C-n>', ':NERDTreeFocus<CR>', default_opts)
map('n', '<leader><C-n>', ':NERDTree<CR>', default_opts)
map('n', '<C-t>', ':NERDTreeToggle<CR>', default_opts)
map('n', '<C-f>', ':NERDTreeFind<CR>', default_opts)

