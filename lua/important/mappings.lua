local mappings_utils = require('utils.mappings_utils')
local map = mappings_utils.map
local default_opts = mappings_utils.default_opts

map('n', '<leader>ff', '<cmd>Telescope live_grep<cr>', default_opts)
