local config = require('ncvim.ui.telescope.config')

ncvim.plugin({
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  config = config,
  requires = {
    { 'nvim-telescope/telescope-dap.nvim', },
    { 'nvim-lua/plenary.nvim', },
    {
      'nvim-telescope/telescope-ui-select.nvim',
      disable = true
    },
    {
      'BurntSushi/ripgrep',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
})

-- ncvim.plugin({
--   'cljoly/telescope-repo.nvim',
--   config = function()
--     require 'telescope'.extensions.repo.cached_list({
--       file_ignore_patterns = {
--         "^" .. vim.env.HOME .. "/%.cache/",
--         "^" .. vim.env.HOME .. "/%.local/",
--         "^" .. vim.env.HOME .. "/%.cargo/",
--       },
--     })
--   end
-- })

require('ncvim.ui.telescope.mappings')
