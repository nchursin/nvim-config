return function()
  local map = vim.keymap.set
  local api = vim.api
  local lsp = vim.lsp

  local lspconfig = require('lspconfig')

  local bufopts = {
    noremap = true,
    silent = true,
    -- buffer=bufnr
  }

  local capabilities = require('cmp_nvim_lsp').default_capabilities(lsp.protocol.make_client_capabilities())

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

  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    map('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<CR>', bufopts)
    map('n', '<leader>qf', '<cmd> lua vim.lsp.buf.code_action()<CR>', bufopts)

    require("lsp-format").on_attach(client)
  end

  require("mason-lspconfig").setup_handlers({
    function(server_name)
      lspconfig[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,

    ['lua_ls'] = function()
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      }
    end
  })
end
