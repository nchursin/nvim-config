local function endsWith(str, suffix)
  -- Check if the suffix is longer than the string, in which case it cannot be a suffix.
  if #suffix > #str then
    return false
  end

  -- Get the substring from the end of the string with the same length as the suffix.
  local endSubstring = string.sub(str, -#suffix)

  -- Compare the end substring with the suffix and return the result.
  return endSubstring == suffix
end

ncvim.plugin({
  "nvim-neotest/neotest",
  event = {
    event = "User",
    pattern = ncvim.events.load_test_plugin,
  },

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

  config = function(_, opts)
    require("neotest").setup({
      -- output = {
      --   open_on_run = false
      -- },
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
          -- args = {"--log-level", "DEBUG"},
          args = { "--log-level", "INFO" },
          runner = "pytest",
          -- python = ".venv/bin/python",
        }),

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

        require("neotest-rust"),
      },
    })
  end,
})
