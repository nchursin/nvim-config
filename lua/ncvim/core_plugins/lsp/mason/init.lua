local config = require('ncvim.core_plugins.lsp.mason.config')

ncvim.plugin({
  'williamboman/mason.nvim',
  run = ":MasonUpdate",
  requires = {
    'neovim/nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'lukas-reineke/lsp-format.nvim',
  },
  config = config,
})
