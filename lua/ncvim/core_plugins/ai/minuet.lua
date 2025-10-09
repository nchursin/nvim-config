ncvim.plugin({
  -- "milanglacier/minuet-ai.nvim",
  "IlyasYOY/minuet-ai.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- это можно использовать с моим fork, тогда будет видно, когда работает расширение.
    "j-hui/fidget.nvim",
  },
  config = function()
    local _, provider = pcall(require, "custom.minuet")

    require("minuet").setup({
      virtualtext = {
        keymap = {
          -- accept whole completion
          accept = "<A-a>",
          -- accept one line
          accept_line = "<A-l>",
          accept_n_lines = nil,
          -- Cycle to prev completion item, or manually invoke completion
          prev = "<A-k>",
          -- Cycle to next completion item, or manually invoke completion
          next = "<A-j>",
          dismiss = "<A-h>",
        },

        -- Whether show virtual text suggestion when the completion menu
        -- (nvim-cmp or blink-cmp) is visible.
        show_on_completion_menu = false,
      },
      provider = provider.type,
      request_timeout = 5,
      throttle = 3000,
      debounce = 1500,
      provider_options = provider.options,
    })

    vim.keymap.set("n", "<leader>cm", "<cmd>Minuet virtualtext toggle<CR>", { desc = "Toggle Minuet virtual text" })

    -- можете использовать это, если подключите мой fork.
    require("minuet.fidget"):init()
  end,
})
