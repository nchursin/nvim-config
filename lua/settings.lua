local map = vim.api.nvim_set_keymap
local cmd = vim.cmd             -- execute Vim commands
local autocmd = vim.api.nvim_create_autocmd
local g = vim.g                 -- global variables
local set = vim.api.nvim_set_option
local fn = vim.fn


-- Various UX
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
-- set('updatetime', 300)
-- set signcolumn=number
-- long lines
-- :set colorcolumn=120

-- Look and Feel settings
cmd([[
    syntax enable
    colorscheme onedark
    highlight SignColumn guibg=Black
    highlight SignColumn ctermbg=Black
]])

-- line numbers
set('number', true)
set('numberwidth', 4)
set('ruler', true)
set('signcolumn', 'yes')
-- auto switch line numbering
cmd([[
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
]])


-- Indentation
-- set autoindent
-- set cindent
-- set smartindent
set('expandtab', true)
set('tabstop', 4)
set('softtabstop', 4)
set('shiftwidth', 4)


-- Disable all bells and whistles
set('errorbells', false)
set('visualbell', false)


autocmd(
    'BufWritePre',
    {
        pattern = '*',
        command = ':%s/\\s\\+$//e'
    }
)

local function reload_plugins()
    -- cmd':Reload'
    cmd':Restart'
    cmd':PackerSync'
end

autocmd(
    'BufWritePost',
    {
        pattern = '*/plugins.lua',
        callback = reload_plugins,
    }
)

-- PLUGINS SETTINGS

-- bufferline
vim.opt.termguicolors = false

-- nerdtree
vim.NERDTreeShowHidden=1

-- eslint
g.formatdef_eslint = '"eslint-formatter"'
g.formatters_javascript = { 'eslint' }
g.formatters_typescript = { 'eslint' }

-- vim-prettier
cmd([[
    let g:prettier#autoformat_config_present = 1
    let g:prettier#autoformat_require_pragma = 0
]])

-- vim-test
vim.cmd ( [[
    let test#strategy = "neovim"
    let g:test#javascript#mocha#file_pattern = '\v((test|spec)s?/.*|(spec))\.(js|jsx|coffee|ts)$'
    let g:test#javascript#webdriverio#file_pattern = '\v((test|spec)s?/.*|(test))\.(js|jsx|coffee|ts)$'
    let g:test#javascript#mocha#executable = 'mocha'
    " let g:test#javascript#runner = 'jest'
    let g:test#javascript#runner = 'mocha'
    " let g:test#javascript#runner = 'webdriverio'
    let test#python#runner = 'pytest'
    let test#strategy = "neovim"
]] )

-- editorconfig
g.EditorConfig_core_mode = 'external_command'
g.EditorConfig_exclude_patterns = { 'fugitive://.*' }


-- nvim-cmp. completions
local cmp = require'cmp'
local types = require('cmp.types')

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-j>'] = {
            i = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
        },
        ['<C-k>'] = {
            i = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
        },
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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
    'sumneko_lua',
    'pylsp',
    'rust_analyzer',
    'sqls',
    'svelte',
    'lemminx',
    'yamlls',
}

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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
  map('n', '<space>rn', '<cmd> lua vim.lsp.buf.rename()<CR>', bufopts)
  map('n', '<space>qf', '<cmd> lua vim.lsp.buf.code_action()<CR>', bufopts)
  map('n', 'gr', '<cmd> lua vim.lsp.buf.references()<CR>', bufopts)
  map('n', '<space>f', '<cmd> lua vim.lsp.buf.formatting()<CR>', bufopts)
end

for _, lspInstance in ipairs(servers) do
  lspconfig[lspInstance].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/apps/vscode-node-debug2/out/src/nodeDebug.js'},
}
fn.sign_define('DapBreakpoint', {text='🅱️', texthl='', linehl='', numhl=''})
fn.sign_define('DapStopped', {text='➡️', texthl='', linehl='', numhl=''})

