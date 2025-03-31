---@class PluginConfig
---@field[opt] disable boolean Mark a plugin as inactive
---@field[opt] as string Specifies an alias under which to install the plugin
---@field[opt] installer function Specifies custom installer. See "custom installers" below.
---@field[opt] updater function Specifies custom updater. See "custom installers" below.
---@field[opt] after string | table Specifies plugins to load before this plugin. See "sequencing" below
---@field[opt] rtp string Specifies a subdirectory of the plugin to add to runtimepath.
---@field[opt] opt boolean Manually marks a plugin as optional.
---@field[opt] bufread boolean Manually specifying if a plugin needs BufRead after being loaded
---@field[opt] branch string Specifies a git branch to use
---@field[opt] tag string Specifies a git tag to use. Supports '*' for "latest tag"
---@field[opt] commit string Specifies a git commit to use
---@field[opt] lock boolean Skip updating this plugin in updates/syncs. Still cleans.
---@field[opt] run string Post-update/install hook. See "update/install hooks".
---@field[opt] requires string | table Specifies plugin dependencies. See "dependencies".
---@field[opt] rocks string | table Specifies Luarocks dependencies for the plugin
---@field[opt] config string | function Specifies code to run after this plugin is loaded.
---@field[opt] setup string | function Specifies code to run before this plugin is loaded. The code is ran even if the plugin is waiting for other conditions (ft, cond...) to be met. Implies opt = true
---@field[opt] cmd string | table Specifies commands which load this plugin. Can be an autocmd pattern. Imply lazy-loading and imply opt = true.
---@field[opt] ft string | table Specifies filetypes which load this plugin. Imply lazy-loading and imply opt = true.
---@field[opt] keys string | table Specifies maps which load this plugin. See "Keybindings". imply lazy-loading and imply opt = true.
---@field[opt] event string | table Specifies autocommand events which load this plugin. Imply lazy-loading and imply opt = true.
---@field[opt] fn string | table          -- Specifies functions which load this plugin. Imply lazy-loading and imply opt = true.
---@field[opt] cond string Specifies a conditional test to load this plugin.  Imply lazy-loading and imply opt = true.
---@field[opt] module string | table      -- Specifies Lua module names for require. When requiring a string which starts with one of these module names, the plugin will be loaded. Imply lazy-loading and imply opt = true.
---@field[opt] module_pattern string | table -- Specifies Lua pattern of Lua module names for require. When requiring a string which matches one of these patterns, the plugin will be loaded. Imply lazy-loading and imply opt = true.

--- Adds plugin to install and setup
--- @param plugin_config PluginConfig
ncvim.plugin = function(plugin_config)
  table.insert(ncvim.plugins, plugin_config)
end

--- Installs plugins and does configuration with packer
ncvim.install_plugins = function()
  for _, plugin in ipairs(ncvim.plugins) do
    require('packer').use(plugin)
  end
end

local transform_for_lazy = function(plugin)
  if type(plugin) == 'string' then
    return plugin
  end
  plugin.init = plugin.setup
  plugin.dependencies = plugin.dependencies or plugin.requires
  plugin.name = plugin.as
  plugin.lazy = plugin.opt
  plugin.build = plugin.run
  plugin.pin = plugin.lock
  plugin.enabled = not plugin.disable
  plugin.version = plugin.tag
  return plugin
end

--- Installs plugins and does configuration with packer
ncvim.install_plugins_lazy = function()
  local transformed = {}
  for _, plugin in ipairs(ncvim.plugins) do
    table.insert(transformed, transform_for_lazy(plugin))
  end
  require('lazy').setup(transformed)
end
