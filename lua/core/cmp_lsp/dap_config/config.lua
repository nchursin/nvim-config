local fn = vim.fn

local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/apps/vscode-node-debug2/out/src/nodeDebug.js'},
}
fn.sign_define('DapBreakpoint', {text='🅱️', texthl='', linehl='', numhl=''})
fn.sign_define('DapStopped', {text='➡️', texthl='', linehl='', numhl=''})

