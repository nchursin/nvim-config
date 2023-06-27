ncvim.plugin({
  {
    'joshdick/onedark.vim',
  },
  {
    'NLKNguyen/papercolor-theme',
  },
})

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

ncvim.themes = themes
ncvim.theme = themes.DARK
