local default_opts = require('utils.mappings_utils').default_opts

vim.g.minimap_auto_start = 0

ncvim.add_mappings {
  {
    mode = 'n',
    key_string = '<leader>mm',
    command = ':MinimapToggle<CR>',
    options = default_opts,
  }
}
