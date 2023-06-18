local treesitter_config = require('ncvim.core_plugins.highlight.treesitter.config')

ncvim.plugin({
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = treesitter_config
})
