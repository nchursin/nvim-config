local g = vim.g
local cmd = vim.cmd

cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'

  -- Visual
  -- use {
  --   'hood/popui.nvim'
  -- }

  -- Usability
  -- use 'easymotion/vim-easymotion'
  -- use 'tpope/vim-surround' -- braces thing
  -- -- use 'vim-airline/vim-airline' -- info line

  -- use {
  --   "folke/which-key.nvim",
  -- }

  -- Git
  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  -- }
  -- use {
  --   'tpope/vim-fugitive'
  -- }
  -- use {
  --   'APZelos/blamer.nvim'
  -- }

  -- Markdown
  -- use {
  --   'instant-markdown/vim-instant-markdown',
  --   ft = 'markdown',
  --   run = 'yarn install',
  -- }

  -- General
  -- tests
  -- use {
  --   'vim-test/vim-test',
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   -- "nvim-neotest/neotest",
  --   -- "antoinemadec/FixCursorHold.nvim",
  --   -- "nvim-neotest/neotest-vim-test",
  --   -- "nvim-neotest/neotest-plenary",
  --   -- "haydenmeade/neotest-jest",
  --   -- "nvim-neotest/neotest-go",
  --   -- "nvim-neotest/neotest-python",
  -- }
  -- debug
  -- use {
  --   'mfussenegger/nvim-dap',
  --   {
  --     'leoluz/nvim-dap-go',
  --   },
  --   {
  --     "rcarriga/nvim-dap-ui",
  --   },
  -- }

  -- use {
  --   "windwp/nvim-autopairs",
  -- }

  -- use {
  --   "ianding1/leetcode.vim",
  -- }

  -- db
  -- use {
  --   --     'nanotee/sqls.nvim'
  --   'tpope/vim-dadbod',
  --   'kristijanhusak/vim-dadbod-ui',
  -- }

  -- use {
  --   'wfxr/minimap.vim',
  -- }
end)
