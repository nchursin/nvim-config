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
    key_string = '<leader>fb',
    command = '<cmd>Telescope buffers<cr>',
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<C-p>',
    command = '<cmd>Telescope find_files<cr>',
    options = silent_noremap,
  },
  -- {
  --   mode = 'n',
  --   key_string = '<leader>fh',
  --   command = '<cmd>Telescope search_history<cr>',
  --   options = silent_noremap,
  -- },

  {
    mode = 'n',
    key_string = '<leader>gh',
    command = '<cmd>Telescope git_bcommits<cr>',
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader>gb',
    command = '<cmd>Telescope git_branches<cr>',
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader>gs',
    command = '<cmd>Telescope git_status<cr>',
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader>gl',
    command = '<cmd>Telescope git_commits<cr>',
    options = silent_noremap,
  },
})
