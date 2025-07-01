local silent_noremap = { noremap = true, silent = true }

ncvim.plugin({
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  cmd = { "CodeCompanionChat", "CodeCompanionActions", "CodeCompanion" },

  config = function()
    local _, adapters = pcall(require, "custom.codecompanion_adapters")
    local _, system_prompt = pcall(require, "custom.codecompanion_system_promt")

    if adapters == nil then
      adapters = {
        opts = {
          show_defaults = true,
        },
      }
    end

    require("codecompanion").setup({
      opts = {
        system_prompt = function(opts)
          if system_prompt == nil then
            return opts.system_prompt
          end
          return system_prompt.system_prompt
        end,
      },
      strategies = {
        chat = {
          adapter = adapters.chat_adapter,
          roles = {
            llm = function(adapter)
              local name = (system_prompt and system_prompt.character and system_prompt.character.name)
                or "CodeCompanion"
              return name .. " (powered by " .. adapter.formatted_name .. ")"
            end,
          },
        },
        inline = {
          adapter = adapters.inline_adapter,
          keymaps = {
            accept_change = {
              modes = { n = "ga" },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = { n = "gr" },
              description = "Reject the suggested change",
            },
          },
        },
        cmd = {
          adapter = adapters.cmd_adapter,
        },
      },
      adapters = adapters.adapters,
    })
  end,
})

ncvim.add_mappings({
  {
    mode = "n",
    key_string = "<leader>cc",
    command = "<cmd>CodeCompanionChat Toggle<CR>",
    options = silent_noremap,
  },
  {
    mode = { "n", "v", "s" },
    key_string = "<leader>ca",
    command = "<cmd>CodeCompanionActions<CR>",
    options = silent_noremap,
  },
  {
    mode = { "n", "v", "s" },
    key_string = "<leader>ci",
    command = "<cmd>CodeCompanion<CR>",
    options = silent_noremap,
  },
})
