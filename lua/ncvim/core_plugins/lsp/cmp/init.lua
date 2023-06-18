local config = require('ncvim.core_plugins.lsp.cmp.config')

ncvim.plugin({
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/vim-vsnip',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
  },
  config = config
})
