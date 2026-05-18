# NCVim — Agent Guide

This is a personal Neovim configuration. Before making any changes, read the docs:

- [Architecture overview](./docs/architecture.md) — how the config boots, what `ncvim` is, and how all pieces fit together
- [Plugin system](./docs/plugin-system.md) — how to add, remove, and configure plugins via `ncvim.plugin()`
- [Customization](./docs/customization.md) — the `lua/custom/` folder for machine-local config and experiments
- [Keybindings](./docs/keybindings.md) — how mappings are declared and applied
- [Installation](./docs/installation.md) — dotbot setup and symlinking

## Quick orientation

The entire config is controlled through the global `ncvim` table. All plugins, mappings, and autocmds are registered into it, then applied in a single pass at startup. Do not call `vim.keymap.set` or `require('lazy').setup()` directly — use `ncvim.*` APIs instead.

Machine-local overrides and experimental plugins go in `lua/custom/`. That directory is gitignored and loaded automatically.
