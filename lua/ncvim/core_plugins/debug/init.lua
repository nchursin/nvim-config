ncvim.plugin({
  'mfussenegger/nvim-dap',
  requires = {
    "rcarriga/nvim-dap-ui",
    'hood/popui.nvim',
  },
  config = function()
    local dap_config = require('ncvim.core_plugins.debug.config')
    local dap_ui_config = require('ncvim.core_plugins.debug.ui')
    dap_config()
    dap_ui_config()
  end
  ,
})

require('ncvim.core_plugins.debug.adapters')
require('ncvim.core_plugins.debug.mappings')
