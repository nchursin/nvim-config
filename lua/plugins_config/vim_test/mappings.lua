local mappings_utils = require('utils.mappings_utils')
local map = mappings_utils.map

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

