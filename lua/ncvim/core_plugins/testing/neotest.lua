ncvim.plugin({
  "nvim-neotest/neotest",

  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "fredrikaverpil/neotest-golang", version = "*"
    },
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-python",
  },

  config = function(_)
    require("neotest").setup({
      adapters = {
        require("neotest-python"),

        require("neotest-rust"),

        require('neotest-golang')({
          runner = "gotestsum",
          gotestsum_args = {
            '--format=testdox',
          },
          go_test_args = {
            "-v",
            "-count=1",
            -- "-race",
          },
        }),
      }
    })
  end,
})
