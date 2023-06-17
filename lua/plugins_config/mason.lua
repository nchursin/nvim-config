require("mason").setup({
  check_outdated_packages_on_open = true,

  registries = {
    "github:mason-org/mason-registry",
    "lua:mason-registry.index"
  },

  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    'lua_ls',
  }
})

-- require'lspconfig'.sumneko_lua.setup {
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = {
--                     'vim'
--                 }
--             }
--         }
--     }
-- }
