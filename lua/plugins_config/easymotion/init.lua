local mappings_utils = require('utils.mappings_utils')
local map = mappings_utils.map
local default_opts = mappings_utils.default_opts

-- easymotion
map ('n', '<leader>f', '<Plug>(easymotion-overwin-f)', default_opts )
map ('n', '<leader>s', '<Plug>(easymotion-overwin-f2)', default_opts )
map ('n', '<leader>w', '<Plug>(easymotion-overwin-w)', default_opts )
