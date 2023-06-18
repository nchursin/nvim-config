local silent_noremap = { noremap = true, silent = true }

ncvim.add_mappings({
  {
    mode = 'n',
    key_string = '<leader>dc',
    command = ":lua require'dap'.continue() <CR>",
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader>db',
    command = ":lua require'dap'.toggle_breakpoint() <CR>",
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader>dj',
    command = ":lua require'dap'.step_over() <CR>",
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader>dl',
    command = ":lua require'dap'.step_into() <CR>",
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader>dk',
    command = ":lua require'dap'.step_out() <CR>",
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader>dr',
    command = ":lua require'dap'.repl.open() <CR>",
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader>dt',
    command = require 'dapui'.toggle,
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader>dq',
    command = ":lua require'dap'.terminate() <CR>",
    options = silent_noremap,
  },
})
