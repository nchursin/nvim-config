local mappings_utils = require('utils.mappings_utils')
local map = mappings_utils.map
local default_opts = mappings_utils.default_opts

require('mini.map').setup()
local MiniMap = require('mini.map')

map('n', '<leader>mm', MiniMap.open, default_opts)
-- MiniMap.open()
-- MiniMap.refresh()
-- MiniMap.close()
-- MiniMap.toggle()
-- MiniMap.toggle_side()
