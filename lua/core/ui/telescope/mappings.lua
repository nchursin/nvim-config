local mappings_utils = require('utils.mappings_utils')
local map = mappings_utils.map
local default_opts = mappings_utils.default_opts

-- telescope
local builtin = require('telescope.builtin')
map('n', '<C-p>', '<cmd>Telescope find_files<cr>', default_opts)
map('n', '<leader>ff', '<cmd>Telescope live_grep<cr>', default_opts)
map('n', '<leader>fh', '<cmd>Telescope search_history<cr>', default_opts)
map('n', '<leader>bb', '<cmd>Telescope buffers<cr>', default_opts)
-- map( 'n', '<leader>fh', '<cmd>Telescope help_tags<cr>', default_opts )

