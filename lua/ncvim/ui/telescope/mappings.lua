local silent_noremap = { noremap = true, silent = true }

ncvim.add_mappings({
  {
    mode = 'n',
    key_string = '<leader>ff',
    command = '<cmd>Telescope live_grep<cr>',
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader>bb',
    command = '<cmd>Telescope buffers<cr>',
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<C-p>',
    command = '<cmd>Telescope find_files<cr>',
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader>fh',
    command = '<cmd>Telescope search_history<cr>',
    options = silent_noremap,
  },
})
