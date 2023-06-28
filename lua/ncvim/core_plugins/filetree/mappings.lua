ncvim.add_mappings {
  {
    mode = 'n',
    key_string = '<C-n>',
    command = ncvim.filetree.focus,
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader><C-n>',
    command = ncvim.filetree.restart,
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<C-t>',
    command = ncvim.filetree.toggle,
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<C-f>',
    command = ncvim.filetree.current_file,
    options = silent_noremap,
  },
}
