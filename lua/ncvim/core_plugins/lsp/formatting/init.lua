ncvim.plugin({
  'mhartington/formatter.nvim',
  config = function()
    -- local util = require "formatter.util"
    require("formatter").setup({
      -- Enable or disable logging
      logging = true,
      -- Set the log level
      log_level = vim.log.levels.WARN,
      filetype = {
        javascript = {
          require("formatter.filetypes.javascript").prettierd,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettierd,
        },
        typescriptreact = {
          require("formatter.filetypes.typescriptreact").prettierd,
        },
        javascriptreact = {
          require("formatter.filetypes.javascriptreact").prettierd,
        },
        json = {
          require("formatter.filetypes.json").jq,
        },
        python = {
          require("formatter.filetypes.python").autoflake,
        },
        -- proto = {
        --   require("formatter.filetypes.proto").buf_format,
        -- },
      },
    })
  end
})

ncvim.add_autocmd(
  'BufWritePost',
  {
    pattern = '*',
    command = ':FormatWrite',
  }
)
