local cmd = vim.cmd

cmd[[
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

