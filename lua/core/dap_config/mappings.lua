local mappings_utils = require('utils.mappings_utils')
local default_opts = mappings_utils.default_opts

-- dap
-- map('n', '<leader>dc', ":lua require'dap'.continue() <CR>", default_opts)
-- map('n', '<leader>db', ":lua require'dap'.toggle_breakpoint() <CR>", default_opts)
-- map('n', '<leader>dj', ":lua require'dap'.step_over() <CR>", default_opts)
-- map('n', '<leader>dl', ":lua require'dap'.step_into() <CR>", default_opts)
-- map('n', '<leader>dk', ":lua require'dap'.step_out() <CR>", default_opts)
-- map('n', '<leader>dr', ":lua require'dap'.repl.open() <CR>", default_opts)
-- map('n', '<leader>dt', ":lua require'dapui'.toggle() <CR>", default_opts)
-- map('n', '<leader>dq', ":lua require'dap'.terminate() <CR>", default_opts)
-- map('n', '<leader>di', ":lua require'dap.ui.wdigets'.hover() <CR>", default_opts)
-- map('n', '<leader>di', ":lua require'dap.ui.wdigets'.hover(function () return vim.fn.expand('<cexpr>') end) <CR>", default_opts)
-- map('n', '<leader>di', ":lua require'dap.ui.wdigets'.visual_hover() <CR>", default_opts)
-- map('n', '<leader>ds', ":lua require'dap.ui.wdigets'.scopes() <CR>", default_opts)

ncvim.add_mappings({
    {
        mode = 'n',
        key_string = '<leader>dc',
        command = ":lua require'dap'.continue() <CR>",
        options = default_opts,
    },
    {
        mode = 'n',
        key_string = '<leader>db',
        command = ":lua require'dap'.toggle_breakpoint() <CR>",
        options = default_opts,
    },
    {
        mode = 'n',
        key_string = '<leader>dj',
        command = ":lua require'dap'.step_over() <CR>",
        options = default_opts,
    },
    {
        mode = 'n',
        key_string = '<leader>dl',
        command = ":lua require'dap'.step_into() <CR>",
        options = default_opts,
    },
    {
        mode = 'n',
        key_string = '<leader>dk',
        command = ":lua require'dap'.step_out() <CR>",
        options = default_opts,
    },
    {
        mode = 'n',
        key_string = '<leader>dr',
        command = ":lua require'dap'.repl.open() <CR>",
        options = default_opts,
    },
    {
        mode = 'n',
        key_string = '<leader>dt',
        command = require'dapui'.toggle,
        options = default_opts,
    },
    {
        mode = 'n',
        key_string = '<leader>dq',
        command = ":lua require'dap'.terminate() <CR>",
        options = default_opts,
    },
})
