local g = vim.g

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'

    -- Visual
    use 'joshdick/onedark.vim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    'bash',
                    'c_sharp',
                    'clojure',
                    'cmake',
                    'css',
                    'dockerfile',
                    'gitattributes',
                    'gitignore',
                    'go',
                    'gomod',
                    'gowork',
                    'graphql',
                    'html',
                    'http',
                    'java',
                    'javascript',
                    'jsdoc',
                    'json',
                    'json5',
                    'kotlin',
                    'latex',
                    'lua',
                    'make',
                    'markdown',
                    'markdown_inline',
                    'python',
                    'regex',
                    'rust',
                    'scss',
                    'sql',
                    'svelte',
                    'toml',
                    'tsx',
                    'typescript',
                    'vim',
                    'vue',
                    'yaml',
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = true,

                -- Automatically install missing parsers when entering buffer
                auto_install = true,

                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                    -- the name of the parser)
                    -- list of language that will be disabled
                    -- disable = { "c", "rust" },

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
        }
        end
    }

    -- completions
    -- Plug 'neovim/nvim-lspconfig'
    -- Plug 'hrsh7th/cmp-nvim-lsp'
    -- Plug 'hrsh7th/cmp-buffer'
    -- Plug 'hrsh7th/cmp-path'
    -- Plug 'hrsh7th/cmp-cmdline'
    use {
        'terrortylor/nvim-comment',
        config = function ()
            require('nvim_comment').setup()
        end
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/vim-vsnip',
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
    }
    use {
        'mfussenegger/nvim-dap',
    }
    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npm run compile"
    }

    -- lsp installer
    use {
        "williamboman/mason.nvim",
        requires = {
            {
                'williamboman/mason-lspconfig.nvim',
                config = function()
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
                            'visualforce',
                            'lemminx',
                            'yamlls',
                        }
                    })
                end
            },
            {
                'neovim/nvim-lspconfig',
            },
        },
        config = function()
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
        end,
    }


    -- Lua
    use "folke/lua-dev.nvim"
    use "nvim-lua/plenary.nvim"

    -- Usability
    use 'easymotion/vim-easymotion'
    use 'tpope/vim-surround' -- braces thing
    -- use 'vim-airline/vim-airline' -- info line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup()
        end,
    }

    -- file tree
    use {
        'preservim/nerdtree',
    }


    use 'ryanoasis/vim-devicons'
    use 'PhilRunninger/nerdtree-visual-selection'

    use {
        'nvim-telescope/telescope-dap.nvim',
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function ()
            require('telescope').setup()
            require('telescope').load_extension('dap')
        end
    }

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use 'famiu/nvim-reload'

    -- Git
    use {
        'airblade/vim-gitgutter',
    } -- Show git diff of lines edited

    -- Javascript/Typescript

    use {
        'eslint/eslint',
    }

    use {
        'prettier/vim-prettier',
        run = 'npm install',
        ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html' },
    }


    -- Markdown
    use {
        'instant-markdown/vim-instant-markdown',
        ft = 'markdown',
        run = 'yarn install',
    }

    -- General
    use {
        'vim-test/vim-test',
    } -- tests

end)
