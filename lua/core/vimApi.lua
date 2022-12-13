local api = {
    g = vim.g,
    cmd = vim.cmd,
    set_option = vim.api.nvim_set_option,
    fn = vim.fn,
    autocmd = vim.api.nvim_create_autocmd,
    map = vim.api.nvim_set_keymap,
    opt = vim.opt,
    lsp = vim.lsp,
    api = vim.api,
    vim = vim,
}

return api
