local silent_noremap = { noremap = true, silent = true }

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
    -- tag = 'release',
    config = function()
      require('gitsigns').setup({
      })
    end
  },
})

ncvim.add_mappings {
  {
    mode = 'n',
    key_string = '<leader>gb',
    command = ':Git blame<CR>',
    options = silent_noremap,
  }
}
