local fn = vim.fn

fn.sign_define('DapBreakpoint', {text='🅱️', texthl='', linehl='', numhl=''})
fn.sign_define('DapStopped', {text='➡️', texthl='', linehl='', numhl=''})

-- no setup
-- require'dap'.setup({});
