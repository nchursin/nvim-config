ncvim.plugin({
  {
    "wfxr/minimap.vim",
    cmd = "MinimapToggle",
    config = function()
      vim.g.minimap_auto_start = 0
    end,
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    -- keys = { -- Example mapping to toggle outline
    --   { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    -- },
    opts = {
      -- Your setup opts here
    },
  },
})

local silent_noremap = { noremap = true, silent = true }

ncvim.add_mappings({
  {
    mode = "n",
    key_string = "<leader>mm",
    command = ncvim.ui.panels.minimap,
    options = silent_noremap,
  },
  {
    mode = "n",
    key_string = "<leader>s",
    command = ncvim.ui.panels.symbois,
    options = silent_noremap,
  },
})
