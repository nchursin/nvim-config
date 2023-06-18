ncvim.plugin({
  'wfxr/minimap.vim',
  config = function()
    vim.g.minimap_auto_start = 0
  end
})

local default_opts = require('utils.mappings_utils').default_opts

ncvim.add_mappings {
  {
    mode = 'n',
    key_string = '<leader>mm',
    command = ':MinimapToggle<CR>',
    options = default_opts,
  }
}
