local cmd = vim.cmd

cmd([[
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
]])

ncvim.testing = {
  test_file = function()
    -- vim.cmd('TestFile')
    require("neotest").run.run(vim.fn.expand("%"))
  end,
  test_nearest = function()
    -- vim.cmd('TestNearest')
    require("neotest").run.run()
  end,
  test_last = function()
    require("neotest").run.run_last()
    -- vim.cmd('TestLast')
  end,
  test_visit = function()
    vim.cmd("TestVisit")
  end,
  test_suite = function()
    require("neotest").run.run({ suite = true })
    -- vim.cmd('TestSuite')
  end,
  debug_nearest = function()
    require("neotest").run.run({ strategy = "dap" })
    -- vim.cmd('call DebugNearest()')
  end,
  debug_last = function()
    require("neotest").run.run_last({ strategy = "dap" })
    -- vim.cmd('call DebugLast()')
  end,
  toggle_test_result = function()
    require("neotest").output_panel.toggle()
  end,
  toggle_test_explorer = function()
    if not require("lazy.core.config").plugins["neotest"]._.loaded then
      vim.rpcnotify(0, ncvim.events.load_test_plugin, {})
    end
    require("neotest").summary.toggle()
  end,
}
