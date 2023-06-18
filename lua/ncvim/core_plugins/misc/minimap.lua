ncvim.plugin({
  'wfxr/minimap.vim',
  config = function()
    vim.g.minimap_auto_start = 0
  end
})

local silent_noremap = { noremap = true, silent = true }

ncvim.add_mappings {
  {
    mode = 'n',
    key_string = '<leader>mm',
    command = ':MinimapToggle<CR>',
    options = silent_noremap,
  }
}
