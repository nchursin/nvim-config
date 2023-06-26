ncvim.plugin({
  {
    'wfxr/minimap.vim',
    config = function()
      vim.g.minimap_auto_start = 0
    end
  },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup({
        keymaps = {
          close = "q",
          fold = "f",
          unfold = "e",
          fold_all = "F",
          unfold_all = "E",
        }
      })
    end
  }
})

local silent_noremap = { noremap = true, silent = true }

ncvim.add_mappings {
  {
    mode = 'n',
    key_string = '<leader>mm',
    command = ':MinimapToggle<CR>',
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader>s',
    command = ':SymbolsOutline<CR>',
    options = silent_noremap,
  },
}
