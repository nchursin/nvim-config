ncvim.plugin {
  'leoluz/nvim-dap-go',
  config = function()
    local dap = require 'dap'

    require('dap-go').setup({
      -- Additional dap configurations can be added.
      -- dap_configurations accepts a list of tables where each entry
      -- represents a dap configuration. For more details do:
      -- :help dap-configuration
      dap_configurations = {
      },
      -- delve configurations
      delve = {
        -- the path to the executable dlv which will be used for debugging.
        -- by default, this is the "dlv" executable on your PATH.
        path = "dlv",
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port
        port = "38697",
        -- additional args to pass to dlv
        args = {

        }
      },
    })

    dap.adapters.delve = {
      type = 'server',
      -- port = '${port}',
      port = '38697',
      executable = {
        command = 'dlv',
        -- args = { 'dap', '-l', '127.0.0.1:${port}' },
        args = { 'dap', '-l', '127.0.0.1:38697' },
      }
    }

    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}"
      },
      -- works with go.mod packages and sub packages
      {
        -- Must be "go" or it will be ignored by the plugin
        type = "go",
        name = "Attach",
        -- mode = "remote",
        mode = "local",
        -- processId = "${command:pickProcess}",
        processId = 14402,
        request = "attach",
      },
      -- {
      --   -- Must be "go" or it will be ignored by the plugin
      --   type = "delve",
      --   name = "Attach remote",
      --   mode = "remote",
      --   request = "attach",
      -- },
      -- {
      --   type = "delve",
      --   name = "Debug test (go.mod)",
      --   request = "launch",
      --   mode = "test",
      --   program = "./${relativeFileDirname}",
      -- },
      -- {
      --   type = "delve",
      --   name = "Debug",
      --   request = "launch",
      --   program = "${file}"
      -- },
    }
  end,
}
