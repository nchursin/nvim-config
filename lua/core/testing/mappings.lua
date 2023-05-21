local mappings_utils = require('utils.mappings_utils')
local map = mappings_utils.map
local cmd = vim.cmd

-- function _G.set_js_runner(runner)
--     cmd[[
--     let test#javascript#runner=
--     ]]
--     vim.g['test#javascript#runner'] = runner
-- end

-- map('n', 't<C-n>', ':TestNearest<CR>', { noremap = false })
-- map('n', 't<C-f>', ':TestFile<CR>', { noremap = false })
-- map('n', 't<C-l>', ':TestLast<CR>', { noremap = false })
-- map('n', 't<C-d>', ':call DebugNearest<CR>', { noremap = false })
-- map('n', 't<C-s>', ':TestSuite<CR>', { noremap = false })
-- map('n', 't<C-g>', ':TestVisit<CR>', { noremap = false })
map('n', 'tn', ':TestNearest<CR>', { noremap = false })
map('n', 'tf', ':TestFile<CR>', { noremap = false })
map('n', 'tl', ':TestLast<CR>', { noremap = false })
map('n', 'td', ':call DebugNearest<CR>', { noremap = false })
map('n', 'ts', ':TestSuite<CR>', { noremap = false })
map('n', 'tg', ':TestVisit<CR>', { noremap = false })

-- map('n', 'tcjw', ":lua set_js_runner('webdriverio')<CR>", { noremap = false })
-- map('n', 'tcjm', ":lua set_js_runner('mocha')<CR>", { noremap = false })
map('n', 'tcjw', ':let g:test#javascript#runner="webdriverio"<CR>', { noremap = false })
map('n', 'tcjm', ':let g:test#javascript#runner="mocha"<CR>', { noremap = false })
map('n', 'tcjj', ':let g:test#javascript#runner="jest"<CR>', { noremap = false })
map('n', 'tsj', ':echo g:test#javascript#runner<CR>', { noremap = false })


-- map('n', 't<C-n>', ':lua require("neotest").run.run()<CR>', { noremap = false })
-- map('n', 't<C-f>', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { noremap = false })
-- map('n', 't<C-d>', ':lua require("neotest").run.run({ strategy = "dap" })<CR>', { noremap = false })
-- map('n', 't<C-l>', ':lua require("neotest").run.run_last()<CR>', { noremap = false })
-- map('n', 't<C-s>', ':lua require("neotest").summary.toggle()<CR>', { noremap = false })
-- map('n', 't<C-t>', ':lua require("neotest").output_panel.toggle()<CR>', { noremap = false })
