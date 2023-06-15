local bufopts = {
  noremap=true,
  silent=true,
}

ncvim.add_mappings({
    {
        mode = 'n',
        key_string = 'gd',
        command = '<cmd> lua vim.g.helpers.open_definitions()<CR>',
        options = bufopts,
    },
    {
        mode = 'n',
        key_string = 'gsd',
        command = '<C-w>v<cmd> lua vim.g.helpers.open_definitions()<CR>',
        options = bufopts,
    },
    {
        mode = 'n',
        key_string = '<C-k>',
        command = '<cmd> lua vim.lsp.buf.signature_help()<CR>',
        options = bufopts,
    },
    {
        mode = 'i',
        key_string = '<C-k>',
        command = '<cmd> lua vim.lsp.buf.signature_help()<CR>',
        options = bufopts,
    },
    {
        mode = 'n',
        key_string = 'gi',
        command = '<cmd> lua vim.g.helpers.open_implementations()<CR>',
        options = bufopts,
    },
    {
        mode = 'n',
        key_string = 'gr',
        command = '<cmd> lua vim.g.helpers.open_references()<CR>',
        options = bufopts,
    },
})
