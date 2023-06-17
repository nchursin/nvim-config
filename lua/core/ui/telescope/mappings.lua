local default_opts = require('utils.mappings_utils').default_opts

ncvim.add_mappings({
  {
    mode = 'n',
    key_string = '<leader>ff',
    command = '<cmd>Telescope live_grep<cr>',
    options = default_opts,
  },
  {
    mode = 'n',
    key_string = '<leader>bb',
    command = '<cmd>Telescope buffers<cr>',
    options = default_opts,
  },
  {
    mode = 'n',
    key_string = '<C-p>',
    command = '<cmd>Telescope find_files<cr>',
    options = default_opts,
  },
  {
    mode = 'n',
    key_string = '<leader>fh',
    command = '<cmd>Telescope search_history<cr>',
    options = default_opts,
  },
})
