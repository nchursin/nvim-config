ncvim.plugin({
  'stevearc/conform.nvim',
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      -- python = { "isort", "black" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      json = { "jq" },
      rust = { "sg" },
      proto = { "buf" },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500 },
  },
})
