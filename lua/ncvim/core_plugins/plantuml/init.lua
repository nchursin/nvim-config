ncvim.add_autocmd({
  "BufRead",
  "BufNewFile",
}, {
  pattern = "*.puml",
  callback = function()
    vim.bo.filetype = "plantuml"
  end,
})

ncvim.plugin({
  "weirongxu/plantuml-previewer.vim",
  ft = "plantuml",
  requires = {
    "tyru/open-browser.vim",
    "aklt/plantuml-syntax",
  },
})
