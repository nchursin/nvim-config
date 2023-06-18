local default_opts = require('utils.mappings_utils').default_opts

ncvim.plugin({
  'easymotion/vim-easymotion',
})

ncvim.add_mappings({
  {
    mode = 'n',
    key_string = '<leader>ef',
    command = '<Plug>(easymotion-overwin-f)',
    options = default_opts
  },
  {
    mode = 'n',
    key_string = '<leader>es',
    command = '<Plug>(easymotion-overwin-f2)',
    options = default_opts
  },
  {
    mode = 'n',
    key_string = '<leader>ew',
    command = '<Plug>(easymotion-overwin-w)',
    options = default_opts
  },
})
