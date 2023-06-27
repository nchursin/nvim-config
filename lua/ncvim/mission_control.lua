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
  config_packer = function()
    vim.cmd 'packadd packer.nvim'

    require('packer').startup(function(use)
      use 'wbthomason/packer.nvim'
      use 'lewis6991/impatient.nvim'
      use 'joshdick/onedark.vim'
      use 'NLKNguyen/papercolor-theme'
    end)
  end,
  mappings = {},
  plugins = {},
  packer_bootstrap = false,
  pickers = {
    sessions = function()
      print('not implemented')
    end
  },
  autocmds = {},
}

ncvim.add_autocmd = function(events, config)
  table.insert(ncvim.autocmds, {
    events = events,
    opts = config,
  })
end

ncvim.create_autocmds = function()
  for _, autocmd in ipairs(ncvim.autocmds) do
    vim.api.nvim_create_autocmd(autocmd.events, autocmd.opts)
  end
end
