return function()
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
      'lua',
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = false,

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

  --local parsers = require 'nvim-treesitter.parsers'
  --function _G.ensure_treesitter_language_installed()
  --local lang = parsers.get_buf_lang()
  --if parsers.get_parser_configs()[lang] and not parsers.has_parser(lang) then
  --vim.schedule_wrap(function()
  --vim.cmd("TSInstallSync " .. lang)
  --vim.cmd [[e!]]
  --end)()
  --end
  --end

  --vim.cmd [[autocmd FileType * :lua ensure_treesitter_language_installed()]]
end
