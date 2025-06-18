local config = require("ncvim.core_plugins.lsp.mason.config")

ncvim.plugin({
  "williamboman/mason.nvim",
  version = "^1.0.0",
  run = ":MasonUpdate",
  requires = {
    "neovim/nvim-lspconfig",
    { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
    "hrsh7th/cmp-nvim-lsp",
    "lukas-reineke/lsp-format.nvim",
  },
  config = config,
})
