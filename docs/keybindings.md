# Keybindings

## How mappings work

Mappings are registered with `ncvim.add_mappings()` and applied in bulk at the end of startup by `ncvim.apply_mappings()`. Do not call `vim.keymap.set()` directly — always go through `ncvim.add_mappings()` so the mapping is visible to the central registry.

## Registering a mapping

```lua
ncvim.add_mappings({
  {
    mode = "n",                              -- vim mode: n, i, v, x, ...
    key_string = "<leader>jp",              -- key sequence
    command = "%!python3 -m json.tool<CR>", -- RHS: string or function
    options = { noremap = true, silent = true },
    desc = "prettify json",                  -- shows in which-key
  },
  {
    mode = "n",
    key_string = "gd",
    command = ncvim.lsp.definitions,        -- function reference works too
    options = { noremap = true, silent = true },
    desc = "go to definitions",
  },
})
```

`ncvim.add_mappings()` accepts a list, so you can register multiple mappings in one call.

## Leader key

`vim.g.mapleader = " "` — leader is **Space**. Set in `lua/ncvim/mappings.lua`.

## Default mappings

All default mappings are in `lua/ncvim/mappings.lua`. Plugin-specific mappings live next to their plugin config (e.g., `lua/ncvim/core_plugins/filetree/mappings.lua`).

Common bindings (not exhaustive):

| Key | Mode | Action |
|---|---|---|
| `<leader>jp` | n | Prettify JSON |
| `gd` | n | Go to definition (Telescope) |
| `gi` | n | Go to implementation (Telescope) |
| `gr` | n | Go to references (Telescope) |
| `<leader>e` | n | Toggle file tree (Neo-tree) |
| `<leader>ff` | n | Find files (Telescope) |
| `<leader>fg` | n | Live grep (Telescope) |
| `<leader>db` | n | Toggle DB UI |

## Adding custom mappings

Put them in a file in `lua/custom/`:

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

## Which-key integration

which-key.nvim is bundled (`lua/ncvim/core_plugins/misc/which_key.lua`). The `desc` field in every mapping spec is shown in the which-key popup automatically.
