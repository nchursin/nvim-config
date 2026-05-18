# Customization

## The `lua/custom/` folder

`lua/custom/` is the extension point for machine-local configuration. Every `.lua` file in that directory is loaded automatically by `lua/load_custom.lua` during startup — after all core modules register their plugins/mappings, but before `setup_ncvim` applies them.

The folder is gitignored (`.gitkeep` keeps it tracked as an empty directory). Anything you put there stays local to that machine.

## What you can do in a custom file

Each custom file is a normal Lua module executed in the ncvim startup context. You have full access to the `ncvim` table.

**Add a plugin:**
```lua
-- lua/custom/obsidian.lua
ncvim.plugin({
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    workspaces = {
      { name = "notes", path = "~/notes" },
    },
  },
})
```

**Add keybindings:**
```lua
-- lua/custom/my_mappings.lua
ncvim.add_mappings({
  {
    mode = "n",
    key_string = "<leader>oo",
    command = "<cmd>ObsidianOpen<CR>",
    options = { noremap = true, silent = true },
    desc = "open obsidian",
  },
})
```

**Override plugin config (e.g., CodeCompanion adapter):**

Create `lua/custom/codecompanion_adapter.lua` returning an adapters table:
```lua
return {
  my_adapter = require("codecompanion.adapters").extend("openai", {
    url = "https://my-endpoint/v1/chat/completions",
    env = { api_key = "MY_KEY" },
  }),
}
```
The core CodeCompanion config in `lua/ncvim/core_plugins/ai/codecompanion.lua` merges this table automatically.

**Custom CodeCompanion system prompt:**

Create `lua/custom/codecompanion_system_prompt.lua`:
```lua
return {
  character = {
    name = "GLaDOS",
  },
  system_prompt = "You are GLaDOS. Be passive-aggressive and reference test chambers.",
}
```

## Project-local env files

NCVim automatically sources `.env.lua` from the current working directory on `VimEnter` and `DirChanged`. Use this for project-specific settings without touching the config repo:

```lua
-- /path/to/project/.env.lua
vim.env.SOME_TOKEN = "secret"
vim.g.my_project_root = "/path/to/project"
```

## Loading order guarantee

```
core modules loaded
    → lua/custom/ files loaded (alphabetical)
        → setup_ncvim applies all registrations
```

Because custom files run before `apply_mappings()` and `lazy.setup()`, every `ncvim.plugin()` and `ncvim.add_mappings()` call in `lua/custom/` is applied in the same pass as core registrations.
