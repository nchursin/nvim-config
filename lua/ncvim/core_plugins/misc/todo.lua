ncvim.plugin({
  "folke/todo-comments.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup({
      keywords = {
        PLAN = {
          icon = "", color = "hint",
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      }
    })
  end
})

ncvim.add_mappings({
  {
    mode = 'n',
    key_string = '<leader>td',
    command = ncvim.ui.panels.todo,
  }
})
