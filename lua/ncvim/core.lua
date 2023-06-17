local themes = {
  DARK = function()
    vim.cmd([[
        syntax enable
        colorscheme onedark
        highlight SignColumn guibg=Black
        highlight SignColumn ctermbg=Black
    ]])
  end,
  LIGHT = function()
    vim.cmd([[
        syntax enable
        colorscheme PaperColor
        set background=dark
        highlight SignColumn guibg=Black
        highlight SignColumn ctermbg=Black
    ]])
  end,
}
---
---Mission control for NcVim
---
---@class NcVim
---@field mappings KeyMapping[]
---@field plugins PluginConfig[]
---@field packer_bootstrap boolean
---@field enums table
---@field theme function
ncvim = {
  mappings = {},
  plugins = {},
  packer_bootstrap = false,
  themes = themes,
  theme = themes.DARK,
}
