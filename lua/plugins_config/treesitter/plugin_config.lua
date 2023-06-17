local function config()
  require 'nvim-treesitter.configs'.setup {
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

config()
