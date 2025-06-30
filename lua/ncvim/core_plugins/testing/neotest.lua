ncvim.plugin({
  "nvim-neotest/neotest",

  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "fredrikaverpil/neotest-golang",
      version = "*",
    },
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
  },

  keys = { "te" },

  config = function(_)
    require("neotest").setup({
      adapters = {
        require("neotest-python"),

        require("neotest-rust"),
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.ts",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),

        require("neotest-golang")({
          runner = "gotestsum",
          gotestsum_args = {
            "--format=testdox",
          },
          go_test_args = {
            "-v",
            "-count=1",
            -- "-race",
          },
        }),
      },
    })
  end,
})
