local api = {
    g = vim.g,
    cmd = vim.cmd,
    set_option = vim.api.nvim_set_option,
    fn = vim.fn,
    autocmd = vim.api.nvim_create_autocmd,
    map = vim.api.nvim_set_keymap,
}

return api
