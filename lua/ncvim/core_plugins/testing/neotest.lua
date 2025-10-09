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
    -- "nvim-treesitter/nvim-treesitter",
    -- {
    --   "fredrikaverpil/neotest-golang",
    --   version = "*",
    -- },
    {
      "nvim-treesitter/nvim-treesitter", -- Optional, but recommended
      branch = "main", -- NOTE; not the master branch!
      build = function()
        vim.cmd(":TSUpdate go")
      end,
    },
    {
      "fredrikaverpil/neotest-golang",
      version = "*", -- Optional, but recommended; track releases
      build = function()
        vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
      end,
    },
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
    "adrigzr/neotest-mocha",
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

        -- require("neotest-mocha")({
        --   command = "npm test --",
        --   command_args = function(context)
        --     -- The context contains:
        --     --   results_path: The file that json results are written to
        --     --   test_name: The exact name of the test; is empty for `file` and `dir` position tests.
        --     --   test_name_pattern: The generated pattern for the test
        --     --   path: The path to the test file
        --     --
        --     -- It should return a string array of arguments
        --     --
        --     -- Not specifying 'command_args' will use the defaults below
        --     return {
        --       "--full-trace",
        --       "--reporter=json",
        --       "--reporter-options=output=" .. context.results_path,
        --       "--grep=" .. context.test_name_pattern,
        --       context.path,
        --     }
        --   end,
        --   env = { CI = true },
        --   cwd = function(path)
        --     return vim.fn.getcwd()
        --   end,
        -- }),
      },
    })
  end,
})
