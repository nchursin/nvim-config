ncvim.add_mappings({
  {
    mode = 'n',
    key_string = '<leader><C-t>',
    command = ncvim.terminal.open,
    options = silent_noremap,
    desc = "open terminal below current buffer",
  },
})
