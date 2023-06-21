ncvim.plugin({
  'hood/popui.nvim',
  config = function()
    vim.ui.input = require "popui.input-overrider"
    vim.ui.select = require "popui.ui-overrider"
  end
})

ncvim.add_mappings({
  {
    mode = { 'n', 'i' },
    key_string = '<C-j>',
    command = require "popui.diagnostics-navigator",
  }
})
