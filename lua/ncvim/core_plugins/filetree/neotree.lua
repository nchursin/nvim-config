ncvim.plugin {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup({

      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        }
      }
    })
  end,
}

ncvim.filetree = {
  toggle = function()
    vim.cmd 'NeoTreeShowToggle'
  end,

  focus = function()
    vim.cmd 'Neotree focus'
  end,

  current_file = function()
    vim.cmd 'Neotree reveal'
  end,

  restart = function()
    vim.cmd 'Neotree'
  end,
}
