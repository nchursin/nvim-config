local config = require('ncvim.ui.telescope.config')

ncvim.plugin({
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0',
  config = config,
  requires = {
    { 'nvim-telescope/telescope-dap.nvim', },
    { 'nvim-lua/plenary.nvim', },
    {
      'nvim-telescope/telescope-ui-select.nvim',
      disable = true
    },
    {
      'BurntSushi/ripgrep',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    }
  },
})

require('ncvim.ui.telescope.mappings')
