require("mason-lspconfig").setup({
    ensure_installed = {
        'lua-language-server',
    }
})

require("mason").setup({
    check_outdated_packages_on_open = true,

    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
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

