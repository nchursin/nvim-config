local treesitter_config = require("ncvim.core_plugins.highlight.treesitter.config")

ncvim.plugin({
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- NOTE; not the master branch!
  run = ":TSUpdate",
  build = function()
    vim.cmd(":TSUpdate go")
  end,
  config = treesitter_config,
})
