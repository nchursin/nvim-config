local mappings_utils = require('utils.mappings_utils')
local map = mappings_utils.map
local default_opts = mappings_utils.default_opts

-- dap
map('n', '<leader>dd', "<cmd> lua require'dap'.continue() <CR>", default_opts)
map('n', '<leader>db', "<cmd> lua require'dap'.toggle_breakpoint() <CR>", default_opts)
map('n', '<leader>do', "<cmd> lua require'dap'.step_over() <CR>", default_opts)
map('n', '<leader>di', "<cmd> lua require'dap'.step_into() <CR>", default_opts)
map('n', '<leader>dr', "<cmd> lua require'dap'.repl.open() <CR>", default_opts)

