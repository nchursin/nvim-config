# Architecture

## The `ncvim` global table

Everything in this config goes through a single global Lua table called `ncvim`. It is defined in `lua/ncvim/mission_control.lua` and populated incrementally as modules load. Think of it as a registry: plugins, mappings, and autocmds are *declared* into `ncvim` during startup, then applied all at once at the end.

Key fields:

| Field | Type | Purpose |
|---|---|---|
| `ncvim.plugins` | `table[]` | All plugin specs collected during init |
| `ncvim.mappings` | `table[]` | All keybinding specs collected during init |
| `ncvim.autocmds` | `table[]` | All autocmd specs collected during init |
| `ncvim.functions` | `table` | Named helper functions (LSP actions, UI toggles) |
| `ncvim.post_install` | `fn[]` | Callbacks run after `lazy.setup()` completes |

Never write to `ncvim.plugins` directly — use `ncvim.plugin()`. Never call `vim.keymap.set()` directly — use `ncvim.add_mappings()`.

## Boot sequence

```
init.lua
 ├── require('preload')           — bootstraps lazy.nvim, calls ncvim.install_plugins_lazy()
 ├── require('ncvim')             — loads core modules in order:
 │    ├── mission_control.lua     — defines the empty ncvim table
 │    ├── mappings_mgmt.lua       — adds ncvim.add_mappings() / ncvim.apply_mappings()
 │    ├── plugin_mgmt.lua         — adds ncvim.plugin() / ncvim.install_plugins_lazy()
 │    ├── ui/                     — themes, telescope, statusline, tabline
 │    ├── functions.lua           — LSP helpers, UI toggles stored in ncvim.functions
 │    ├── mappings.lua            — registers all default keybindings
 │    ├── core_plugins/           — registers all bundled plugins (lsp, treesitter, etc.)
 │    └── autocmd.lua             — registers default autocmds
 ├── require('load_custom')       — loads every .lua file from lua/custom/ alphabetically
 └── require('setup_ncvim')       — applies everything:
      ├── ncvim.apply_mappings()
      ├── ncvim.create_autocmds()
      ├── ncvim.theme()
      └── runs post_install callbacks
```

The critical invariant: `lua/custom/` files are loaded *after* all core modules but *before* `setup_ncvim` applies anything. This means custom files can call `ncvim.plugin()`, `ncvim.add_mappings()`, etc., and their registrations will be applied in the same pass as the core ones.

## Plugin manager

**lazy.nvim** is used as the plugin manager. `ncvim.plugin()` accepts specs in a packer-compatible superset format and internally converts them to lazy.nvim format via `transform_for_lazy()` in `lua/ncvim/plugin_mgmt.lua`. The conversion handles:

- `requires` → `dependencies`
- `setup` → `init`
- `opt = true` → `lazy = true`
- `run` → `build`

## Directory map

```
lua/
 ├── preload.lua          — lazy.nvim bootstrap
 ├── setup_ncvim.lua      — final apply step
 ├── load_custom.lua      — dynamic loader for lua/custom/
 ├── ncvim/
 │    ├── mission_control.lua
 │    ├── plugin_mgmt.lua
 │    ├── mappings_mgmt.lua
 │    ├── functions.lua
 │    ├── utils.lua
 │    ├── autocmd.lua
 │    ├── mappings.lua
 │    ├── ui/             — themes, telescope, statusline, tabline, welcome screen
 │    └── core_plugins/   — one subfolder per feature area
 │         ├── lsp/       — Mason, nvim-cmp, conform, lightbulb
 │         ├── highlight/ — Treesitter
 │         ├── filetree/  — Neo-tree
 │         ├── terminal/  — toggleterm
 │         ├── ai/        — CodeCompanion, Minuet, OpenCode
 │         ├── debug/     — DAP
 │         ├── testing/
 │         └── misc/      — git, surround, which-key, autopairs, etc.
 └── custom/              — machine-local, gitignored (see customization.md)
```
