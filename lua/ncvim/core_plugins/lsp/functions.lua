local bufopts = {
  noremap = true,
  silent = true,
  -- buffer=bufnr
}

vim.lsp.inlay_hint.enable(true)

ncvim.lsp.on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.keymap.set('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<CR>', bufopts)
  vim.keymap.set('n', '<leader>qf', '<cmd> lua vim.lsp.buf.code_action()<CR>', bufopts)
  vim.keymap.set('v', '<leader>qf', '<cmd> lua vim.lsp.buf.code_action()<CR>', bufopts)

  require("lsp-format").on_attach(client)
end
