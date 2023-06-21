local cmd = vim.cmd

cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
end)

---
---Mission control for NcVim
---
---@class NcVim
---@field mappings KeyMapping[]
---@field plugins PluginConfig[]
---@field packer_bootstrap boolean
---@field enums table
---@field theme function
---@field functions table
---@field pickers table
ncvim = {
  mappings = {},
  plugins = {},
  packer_bootstrap = false,
  pickers = {
    sessions = function()
      print('not implemented')
    end
  }
}
