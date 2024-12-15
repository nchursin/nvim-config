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

ncvim.add_mappings {
  {
    mode = 'n',
    key_string = 'tn',
    -- command = ':TestNearest<CR>',
    command = ncvim.testing.test_nearest,
    options = { noremap = false },
  },
  {
    mode = 'n',
    key_string = 'tf',
    -- command = ':TestFile<CR>',
    command = ncvim.testing.test_file,
    options = { noremap = false },
  },
  {
    mode = 'n',
    key_string = 'tl',
    -- command = ':TestLast<CR>',
    command = ncvim.testing.test_last,
    options = { noremap = false },
  },
  {
    mode = 'n',
    key_string = 'tdn',
    -- command = ':call DebugNearest()<CR>',
    command = ncvim.testing.debug_nearest,
    options = { noremap = false },
  },
  {
    mode = 'n',
    key_string = 'tdl',
    -- command = ':call DebugLast()<CR>',
    command = ncvim.testing.debug_last,
    options = { noremap = false },
  },
  {
    mode = 'n',
    key_string = 'ts',
    -- command = ':TestSuite<CR>',
    command = ncvim.testing.test_suite,
    options = { noremap = false },
  },

  {
    mode = 'n',
    key_string = 'tr',
    -- command = ':TestVisit<CR>',
    command = ncvim.testing.toggle_test_result,
    options = { noremap = false },
  },

  {
    mode = 'n',
    key_string = 'te',
    -- command = ':TestVisit<CR>',
    command = ncvim.testing.toggle_test_explorer,
    options = { noremap = false },
  },

  -- {
  --   mode = 'n',
  --   key_string = 'tcjw',
  --   command = ':let g:test#javascript#runner="webdriverio"<CR>',
  --   options = { noremap = false },
  -- },
  -- {
  --   mode = 'n',
  --   key_string = 'tcjm',
  --   command = ':let g:test#javascript#runner="mocha"<CR>',
  --   options = { noremap = false },
  -- },
  -- {
  --   mode = 'n',
  --   key_string = 'tcjj',
  --   command = ':let g:test#javascript#runner="jest"<CR>',
  --   options = { noremap = false },
  -- },
  -- {
  --   mode = 'n',
  --   key_string = 'tsj',
  --   command = ':echo g:test#javascript#runner<CR>',
  --   options = { noremap = false },
  -- },
}

-- map('n', 'tcjw', ":lua set_js_runner('webdriverio')<CR>", { noremap = false })
-- map('n', 'tcjm', ":lua set_js_runner('mocha')<CR>", { noremap = false })

-- map('n', 't<C-n>', ':lua require("neotest").run.run()<CR>', { noremap = false })
-- map('n', 't<C-f>', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { noremap = false })
-- map('n', 't<C-d>', ':lua require("neotest").run.run({ strategy = "dap" })<CR>', { noremap = false })
-- map('n', 't<C-l>', ':lua require("neotest").run.run_last()<CR>', { noremap = false })
-- map('n', 't<C-s>', ':lua require("neotest").summary.toggle()<CR>', { noremap = false })
-- map('n', 't<C-t>', ':lua require("neotest").output_panel.toggle()<CR>', { noremap = false })
