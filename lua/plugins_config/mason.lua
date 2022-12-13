require("mason-lspconfig").setup({
    ensure_installed = {
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
        'sumneko_lua',
        'pylsp',
        'rust_analyzer',
        'sqls',
        'svelte',
        'lemminx',
        'yamlls',
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

require'lspconfig'.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim'
                }
            }
        }
    }
}

