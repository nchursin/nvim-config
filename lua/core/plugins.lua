local g = vim.g
local cmd = vim.cmd

cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'

    -- Visual
    use 'joshdick/onedark.vim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- completions
    -- Plug 'neovim/nvim-lspconfig'
    -- Plug 'hrsh7th/cmp-nvim-lsp'
    -- Plug 'hrsh7th/cmp-buffer'
    -- Plug 'hrsh7th/cmp-path'
    -- Plug 'hrsh7th/cmp-cmdline'
    use {
        'terrortylor/nvim-comment',
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

    -- lsp installer
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        requires = {
            {
                'williamboman/mason-lspconfig.nvim',
            },
            {
                'neovim/nvim-lspconfig',
            },
        },
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
    }

    -- file tree
    use {
        'preservim/nerdtree',
    }


    use 'ryanoasis/vim-devicons'
    use 'PhilRunninger/nerdtree-visual-selection'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} },
    }

    use {
        "folke/which-key.nvim",
    }

    use 'famiu/nvim-reload'

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

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
     -- tests
    use {
        'vim-test/vim-test',
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-vim-test",
        "nvim-neotest/neotest-plenary",
        "haydenmeade/neotest-jest",
        "nvim-neotest/neotest-go",
        "nvim-neotest/neotest-python",
    }
    -- debug
    use {
        'mfussenegger/nvim-dap',
        'nvim-telescope/telescope-dap.nvim',
        {
            "microsoft/vscode-js-debug",
            opt = true,
            run = "npm install --legacy-peer-deps && npm run compile",
        },
        {
            'leoluz/nvim-dap-go',
        },
        {
            "mxsdev/nvim-dap-vscode-js",
        },
        {
            "rcarriga/nvim-dap-ui",
        },
    }

    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use {
        "windwp/nvim-autopairs",
    }

end)

