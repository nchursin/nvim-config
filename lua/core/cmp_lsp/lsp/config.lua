local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local lsp = vim.lsp
local api = vim.api

local bufopts = {
  noremap=true,
  silent=true,
  -- buffer=bufnr
}

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(lsp.protocol.make_client_capabilities())

local lspconfig = require('lspconfig')
local servers = {
    'bashls',
    'cssls',
    'clojure_lsp',
    'dockerls',
    'eslint',
    'gopls',
    'bufls',
    'graphql',
    'html',
    'jsonls',
    'jdtls',
    'tsserver',
    'kotlin_language_server',
    'pylsp',
    'rust_analyzer',
    'sqlls',
    'svelte',
    'lemminx',
    'yamlls',
}

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  map('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<CR>', bufopts)
  map('n', '<leader>qf', '<cmd> lua vim.lsp.buf.code_action()<CR>', bufopts)

  require("lsp-format").on_attach(client)
end

for _, lspInstance in ipairs(servers) do
  lspconfig[lspInstance].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

