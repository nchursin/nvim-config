local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local lsp = vim.lsp
local api = vim.api

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(lsp.protocol.make_client_capabilities())

local lspconfig = require('lspconfig')
local servers = {
    'apex_ls',
    'bashls',
    'cssls',
    'clojure_lsp',
    'dockerls',
    'eslint',
    'gopls',
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

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = {
      noremap=true,
      silent=true,
      -- buffer=bufnr
  }
  -- map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', '<cmd> lua vim.lsp.buf.definition()<CR>', bufopts)
  map('n', 'gsd', '<C-w>v<cmd> lua vim.lsp.buf.definition()<CR>', bufopts)
  map('n', '<leader>gd', '<C-w>v<cmd> lua vim.lsp.buf.definition()<CR>', bufopts)
  -- map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', 'gi', '<cmd> lua vim.lsp.buf.implementation()<CR>', bufopts)
  map('n', '<C-k>', '<cmd> lua vim.lsp.buf.signature_help()<CR>', bufopts)
  -- map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- map('n', '<space>wl', function()
    -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  map('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<CR>', bufopts)
  map('n', '<leader>qf', '<cmd> lua vim.lsp.buf.code_action()<CR>', bufopts)
  map('n', 'gr', '<cmd> lua vim.g.helpers.open_references()<CR>', bufopts)
  -- map('n', '<space>f', '<cmd> lua vim.lsp.buf.formatting()<CR>', bufopts)

  require("lsp-format").on_attach(client)
end

for _, lspInstance in ipairs(servers) do
  lspconfig[lspInstance].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

cmd[[
augroup LspBuf
  au!
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'bufls',
      \ 'cmd': {server_info->['bufls', 'serve']},
      \ 'whitelist': ['proto'],
      \ })
  autocmd FileType proto nmap <buffer> gd <plug>(lsp-definition)
augroup END
]]
