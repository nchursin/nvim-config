local silent_noremap = { noremap = true, silent = true }

ncvim.plugin({
  'easymotion/vim-easymotion',
})

ncvim.add_mappings({
  {
    mode = 'n',
    key_string = '<leader>ef',
    command = '<Plug>(easymotion-overwin-f)',
    options = silent_noremap
  },
  {
    mode = 'n',
    key_string = '<space><space>',
    command = '<Plug>(easymotion-overwin-f2)',
    options = silent_noremap
  },
  {
    mode = 'n',
    key_string = '<leader>es',
    command = '<Plug>(easymotion-overwin-f2)',
    options = silent_noremap
  },
  {
    mode = 'n',
    key_string = '<leader>ew',
    command = '<Plug>(easymotion-overwin-w)',
    options = silent_noremap
  },
})
