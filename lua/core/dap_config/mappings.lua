local mappings_utils = require('utils.mappings_utils')
local map = mappings_utils.map
local default_opts = mappings_utils.default_opts

-- dap
map('n', '<leader>dc', ":lua require'dap'.continue() <CR>", default_opts)
map('n', '<leader>db', ":lua require'dap'.toggle_breakpoint() <CR>", default_opts)
map('n', '<leader>dj', ":lua require'dap'.step_over() <CR>", default_opts)
map('n', '<leader>dl', ":lua require'dap'.step_into() <CR>", default_opts)
map('n', '<leader>dk', ":lua require'dap'.step_out() <CR>", default_opts)
map('n', '<leader>dr', ":lua require'dap'.repl.open() <CR>", default_opts)
map('n', '<leader>dt', ":lua require'dapui'.toggle() <CR>", default_opts)
-- map('n', '<leader>di', ":lua require'dap.ui.wdigets'.hover() <CR>", default_opts)
-- map('n', '<leader>di', ":lua require'dap.ui.wdigets'.hover(function () return vim.fn.expand('<cexpr>') end) <CR>", default_opts)
-- map('n', '<leader>di', ":lua require'dap.ui.wdigets'.visual_hover() <CR>", default_opts)
-- map('n', '<leader>ds', ":lua require'dap.ui.wdigets'.scopes() <CR>", default_opts)

