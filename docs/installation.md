# Installation

## Prerequisites

- Neovim ≥ 0.9
- git
- A Nerd Font (for icons in statusline and file tree)

## Install

```sh
git clone <repo> ~/path/to/ncvim
cd ~/path/to/ncvim
./install
```

`./install` runs dotbot with `install.conf.yaml`.

## What dotbot does

`install.conf.yaml` performs three steps:

1. **Create** `~/.config/nvim` if it does not exist.
2. **Symlink** `init.lua` → `~/.config/nvim/init.lua`
3. **Symlink** `lua/` → `~/.config/nvim/lua`

With `relink: true`, existing symlinks are replaced without error.

The result is that `~/.config/nvim` points into this repo, so editing files here is the same as editing the live config.

## Plugin bootstrap

On first launch, lazy.nvim is not yet installed. `lua/preload.lua` detects this and clones it automatically:

```
~/.local/share/nvim/lazy/lazy.nvim
```

After that, lazy.nvim installs all registered plugins on startup. No manual `:Lazy sync` is needed after a fresh install.

## Adding this config to a new machine

```sh
git clone <repo> ~/dotfiles/nvim
cd ~/dotfiles/nvim
./install
nvim   # lazy.nvim bootstraps, then installs plugins
```

Machine-local plugins and settings go in `lua/custom/` — create that directory (or it may already exist as an empty gitignored folder) and add your files there.

## Updating

```sh
git pull
nvim +Lazy sync +qa   # or just open nvim and run :Lazy sync
```
