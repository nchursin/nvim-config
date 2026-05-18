# Plugin System

## Adding a plugin

Call `ncvim.plugin()` with a lazy.nvim-compatible spec. The function appends the spec to `ncvim.plugins[]`; it does not install anything immediately.

```lua
ncvim.plugin({
  "author/repo",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    some_option = true,
  },
})
```

For plugins that need imperative setup, use `config`:

```lua
ncvim.plugin({
  "author/repo",
  config = function()
    require("repo").setup({ ... })
  end,
})
```

## Supported spec fields

`ncvim.plugin()` accepts both native lazy.nvim fields and a packer-compatible superset. The following aliases are automatically converted:

| ncvim / packer field | lazy.nvim equivalent |
|---|---|
| `requires` | `dependencies` |
| `setup` | `init` |
| `opt = true` | `lazy = true` |
| `run` | `build` |

Use native lazy.nvim fields (`dependencies`, `lazy`, `build`) when writing new plugins — the aliases exist only for backward compatibility.

## Where to put plugins

| Location | Use case |
|---|---|
| `lua/ncvim/core_plugins/<area>/` | Bundled plugins that belong to every machine |
| `lua/custom/` | Machine-local or experimental plugins (see [customization.md](./customization.md)) |

Each file under `core_plugins/` calls `ncvim.plugin()` for its own plugins and is `require`d from `lua/ncvim/core_plugins/init.lua`.

## Post-install hooks

If you need to run code *after* `lazy.setup()` completes (e.g., trigger `:MasonUpdate`):

```lua
table.insert(ncvim.post_install, function()
  vim.cmd("MasonUpdate")
end)
```

`setup_ncvim.lua` iterates `ncvim.post_install` at the very end of startup.

## Disabling a bundled plugin

There is no disable API. To stop a bundled plugin from loading, either:

1. Remove or comment out its `ncvim.plugin()` call in the relevant `core_plugins/` file.
2. Override it in `lua/custom/` using lazy.nvim's `enabled = false`:

```lua
-- lua/custom/disable_hardtime.lua
ncvim.plugin({ "m4xshen/hardtime.nvim", enabled = false })
```
