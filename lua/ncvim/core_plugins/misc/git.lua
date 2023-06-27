ncvim.plugin({
  {
    'tpope/vim-fugitive',
  },
  {
    'APZelos/blamer.nvim',
    config = function()
      vim.g.blamer_enabled = 1
      vim.g.blamer_show_in_insert_modes = 0
      vim.g.blamer_template = '<commit-short> - <author>, <author-time>: <summary>'
      vim.g.blamer_delay = 500
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
      })
    end
  },
})
