ncvim.plugin({
  "folke/todo-comments.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup({})
  end
})

ncvim.add_mappings({
  {
    mode = 'n',
    key_string = '<leader>td',
    command = ':TodoLocList keywords=TODO,FIX,FIXME<CR>'
  }
})
