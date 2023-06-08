local map = vim.api.nvim_set_keymap

local bufopts = {
  noremap=true,
  silent=true,
  -- buffer=bufnr
}

map('n', 'gd', '<cmd> lua vim.g.helpers.open_definitions()<CR>', bufopts)
map('n', 'gsd', '<C-w>v<cmd> lua vim.g.helpers.open_definitions()<CR>', bufopts)

map('n', '<C-k>', '<cmd> lua vim.lsp.buf.signature_help()<CR>', bufopts)
map('i', '<C-k>', '<cmd> lua vim.lsp.buf.signature_help()<CR>', bufopts)

map('n', 'gi', '<cmd> lua vim.g.helpers.open_implementations()<CR>', bufopts)
map('n', 'gr', '<cmd> lua vim.g.helpers.open_references()<CR>', bufopts)

