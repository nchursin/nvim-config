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
        http = {
          opts = {
            show_defaults = true,
          },
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
              modes = {
                n = "ga",
                i = "<C-g><C-a>",
              },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = {
                n = "gr",
                i = "<C-g><C-r>",
              },
              description = "Reject the suggested change",
            },
          },
        },
        cmd = {
          adapter = adapters.cmd_adapter,
        },
      },
      prompt_library = {
        ["Commit Message Inline"] = {
          strategy = "inline",
          description = "Generate a commit message",
          opts = {
            is_default = true,
            is_slash_cmd = true,
            user_prompt = false,
            short_name = "inline-commit",
            placement = "before",
            stop_context_insertion = true,
            auto_submit = true,
          },
          prompts = {
            {
              role = "user",
              content = function()
                return string.format(
                  [[
You are an expert at following the Conventional Commit specification.

- Commit message must be in English

Given the git diff listed below, please generate a commit message for me:

```diff
%s
```
]],
                  vim.fn.system("git diff --no-ext-diff --staged")
                )
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },

        ["Doc Comment"] = {
          strategy = "chat",
          description = "Generate doc comments for the selected method",
          opts = {
            index = 12, -- Adjust the index as needed
            is_slash_cmd = false,
            auto_submit = false,
            short_name = "doc_comment",
          },
          references = {}, -- Add any relevant references if needed
          prompts = {
            {
              role = "system",
              content = function(context)
                return "I want you to generate a doc comment for the following "
                  .. context.filetype
                  .. " method. Please provide a concise and informative doc comment."
              end,
            },
            {
              role = "user",
              content = function(context)
                -- local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
                -- return "Here is the method:\n\n```" .. context.filetype .. "\n" .. text .. "\n```\n\n"
                return "Here is the method:"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
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
  {
    mode = { "i" },
    key_string = "<C-c><C-i>",
    command = "<cmd>CodeCompanion<CR>",
    options = silent_noremap,
  },
  {
    mode = { "n" },
    key_string = "<leader>aigc",
    command = "<cmd>CodeCompanion /inline-commit<CR>",
    options = silent_noremap,
  },
})
