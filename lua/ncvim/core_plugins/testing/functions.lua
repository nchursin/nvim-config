local cmd = vim.cmd

cmd [[
	function! DebugNearest()
	  let g:test#go#runner = 'delve'
	  lua require('dap-go').debug_test()
	  unlet g:test#go#runner
	endfunction

	function! DebugLast()
	  let g:test#go#runner = 'delve'
	  lua require('dap-go').debug_last_test()
	  unlet g:test#go#runner
	endfunction
]]

ncvim.testing = {
  test_file = function()
    vim.cmd('TestFile')
  end,
  test_nearest = function()
    vim.cmd('TestNearest')
  end,
  test_last = function()
    vim.cmd('TestLast')
  end,
  test_visit = function()
    vim.cmd('TestVisit')
  end,
  test_suite = function()
    vim.cmd('TestSuite')
  end,
  debug_nearest = function()
    vim.cmd('call DebugNearest()')
  end,
  debug_last = function()
    vim.cmd('call DebugLast()')
  end,
}
