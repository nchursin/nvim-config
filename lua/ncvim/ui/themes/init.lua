ncvim.plugin(require('ncvim.ui.themes.theme2'))

local function write_theme_config(config)
  local Path = require('plenary.path')
  local config_path = Path.new(vim.fn.stdpath('config'))
  -- local config_path = Path.expand( vim.fn.stdpath('config') )
  local filepath = Path.joinpath(config_path, 'lua', 'custom', 'theme.lua')

  local filename = Path.expand(filepath)
  local file = io.open(filename, "w")

  -- sets the default output file as test.lua
  io.output(file)

  -- appends a word test to the last line of the file
  io.write(config)

  -- closes the open file
  io.close(file)
end

local themes = {
  DARK = function()
    vim.cmd([[
        syntax enable
        colorscheme catppuccin
        set background=dark
    ]])

    --highlight SignColumn guibg=Black
    --highlight SignColumn ctermbg=Black
  end,
  LIGHT = function()
    vim.cmd([[
        syntax enable
        colorscheme catppuccin
        set background=light
    ]])

    --highlight SignColumn guibg=Light
    --highlight SignColumn ctermbg=Light
  end,
}

ncvim.themes = themes
ncvim.theme = themes.DARK
ncvim.set_theme = function(theme_name)
  if not ncvim.themes[theme_name] then
    print("unknown theme: " .. theme_name)
    return
  end
  local config = 'ncvim.theme = ncvim.themes.' .. theme_name
  write_theme_config(config)
  ncvim.themes[theme_name]()
end
