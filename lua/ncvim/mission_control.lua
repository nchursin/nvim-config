---
---Mission control for NcVim
---
---@class NcVim
---@field mappings KeyMapping[]
---@field plugins PluginConfig[]
---@field packer_bootstrap boolean
---@field enums table
---@field theme function
---@field functions table
---@field pickers table
ncvim = {
  mappings = {},
  plugins = {
    "lewis6991/impatient.nvim",
    --'joshdick/onedark.vim',
    -- {
    --   "olimorris/onedarkpro.nvim",
    --   priority = 1000,
    -- },
    -- {
    --   'catppuccin/nvim',
    --   config = function()
    --     require("catppuccin").setup({
    --       background = {
    --         light = "latte",
    --         dark = "macchiato",
    --       },
    --       color_overrides = {
    --         macchiato = {
    --           base = "#1c1917",
    --           blue = "#22d3ee",
    --           green = "#86efac",
    --           flamingo = "#D6409F",
    --           lavender = "#DE51A8",
    --           pink = "#f9a8d4",
    --           red = "#fda4af",
    --           maroon = "#f87171",
    --           mauve = "#D19DFF",
    --           text = "#E8E2D9",
    --           sky = "#7ee6fd",
    --           yellow = "#fde68a",
    --           rosewater = "#f4c2c2",
    --           peach = "#fba8c4",
    --           teal = "#4fd1c5"
    --         },
    --
    --         -- mocha = {
    --         --   rosewater = "#EA6962",
    --         --   flamingo = "#EA6962",
    --         --   pink = "#D3869B",
    --         --   mauve = "#D3869B",
    --         --   red = "#EA6962",
    --         --   maroon = "#EA6962",
    --         --   peach = "#BD6F3E",
    --         --   yellow = "#D8A657",
    --         --   green = "#A9B665",
    --         --   teal = "#89B482",
    --         --   sky = "#89B482",
    --         --   sapphire = "#89B482",
    --         --   blue = "#7DAEA3",
    --         --   lavender = "#7DAEA3",
    --         --   text = "#D4BE98",
    --         --   subtext1 = "#BDAE8B",
    --         --   subtext0 = "#A69372",
    --         --   overlay2 = "#8C7A58",
    --         --   overlay1 = "#735F3F",
    --         --   overlay0 = "#5A4525",
    --         --   surface2 = "#4B4F51",
    --         --   surface1 = "#2A2D2E",
    --         --   surface0 = "#232728",
    --         --   base = "#1D2021",
    --         --   mantle = "#191C1D",
    --         --   crust = "#151819",
    --         -- },
    --         latte = {
    --           rosewater = "#c14a4a",
    --           flamingo = "#c14a4a",
    --           pink = "#945e80",
    --           mauve = "#945e80",
    --           red = "#c14a4a",
    --           maroon = "#c14a4a",
    --           peach = "#c35e0a",
    --           yellow = "#a96b2c",
    --           green = "#6c782e",
    --           teal = "#4c7a5d",
    --           sky = "#4c7a5d",
    --           sapphire = "#4c7a5d",
    --           blue = "#45707a",
    --           lavender = "#45707a",
    --           text = "#654735",
    --           subtext1 = "#7b5d44",
    --           subtext0 = "#8f6f56",
    --           overlay2 = "#a28368",
    --           overlay1 = "#b6977a",
    --           overlay0 = "#c9aa8c",
    --           surface2 = "#A79C86",
    --           surface1 = "#C9C19F",
    --           surface0 = "#DFD6B1",
    --           base = "#fbf1c7",
    --           mantle = "#F3EAC1",
    --           crust = "#E7DEB7",
    --         },
    --       },
    --       styles = {
    --         comments = { "italic" },
    --         conditionals = { "italic" },
    --         loops = { "bold" },
    --         functions = { "bold" },
    --         keywords = { "bold" },
    --         strings = {},
    --         variables = {},
    --         numbers = { "bold" },
    --         booleans = { "bold" },
    --         properties = {},
    --         types = { "bold" },
    --         operators = {},
    --       },
    --       transparent_background = false,
    --       show_end_of_buffer = false,
    --       custom_highlights = function(colors)
    --         return {
    --           NormalFloat = { bg = colors.crust },
    --           FloatBorder = { bg = colors.crust, fg = colors.crust },
    --           VertSplit = { bg = colors.base, fg = colors.surface0 },
    --           CursorLineNr = { fg = colors.mauve, style = { "bold" } },
    --           Pmenu = { bg = colors.crust, fg = "" },
    --           PmenuSel = { bg = colors.surface0, fg = "" },
    --           TelescopeSelection = { bg = colors.surface0 },
    --           TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },
    --           TelescopePromptPrefix = { bg = colors.surface0 },
    --           TelescopePromptNormal = { bg = colors.surface0 },
    --           TelescopeResultsNormal = { bg = colors.mantle },
    --           TelescopePreviewNormal = { bg = colors.crust },
    --           TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
    --           TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
    --           TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
    --           TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
    --           TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
    --           TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
    --           IndentBlanklineChar = { fg = colors.surface0 },
    --           IndentBlanklineContextChar = { fg = colors.surface2 },
    --           GitSignsChange = { fg = colors.peach },
    --           NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
    --           NvimTreeExecFile = { fg = colors.text },
    --         }
    --       end,
    --     })
    --
    --     vim.api.nvim_command("colorscheme catppuccin")
    --     require("catppuccin").setup({
    --       background = {
    --         light = "latte",
    --         dark = "macchiato",
    --       },
    --       color_overrides = {
    --         latte = {
    --           rosewater = "#c14a4a",
    --           flamingo = "#c14a4a",
    --           pink = "#945e80",
    --           mauve = "#945e80",
    --           red = "#c14a4a",
    --           maroon = "#c14a4a",
    --           peach = "#c35e0a",
    --           yellow = "#a96b2c",
    --           green = "#6c782e",
    --           teal = "#4c7a5d",
    --           sky = "#4c7a5d",
    --           sapphire = "#4c7a5d",
    --           blue = "#45707a",
    --           lavender = "#45707a",
    --           text = "#654735",
    --           subtext1 = "#7b5d44",
    --           subtext0 = "#8f6f56",
    --           overlay2 = "#a28368",
    --           overlay1 = "#b6977a",
    --           overlay0 = "#c9aa8c",
    --           surface2 = "#A79C86",
    --           surface1 = "#C9C19F",
    --           surface0 = "#DFD6B1",
    --           base = "#fbf1c7",
    --           mantle = "#F3EAC1",
    --           crust = "#E7DEB7",
    --         },
    --
    --         macchiato = {
    --           base = "#1c1917",
    --           blue = "#22d3ee",
    --           green = "#86efac",
    --           flamingo = "#D6409F",
    --           lavender = "#DE51A8",
    --           pink = "#f9a8d4",
    --           red = "#fda4af",
    --           maroon = "#f87171",
    --           mauve = "#D19DFF",
    --           text = "#E8E2D9",
    --           sky = "#7ee6fd",
    --           yellow = "#fde68a",
    --           rosewater = "#f4c2c2",
    --           peach = "#fba8c4",
    --           teal = "#4fd1c5"
    --         },
    --       },
    --       styles = {
    --         comments = { "italic" },
    --         conditionals = { "italic" },
    --         loops = { "bold" },
    --         functions = { "bold" },
    --         keywords = { "bold" },
    --         strings = {},
    --         variables = {},
    --         numbers = { "bold" },
    --         booleans = { "bold" },
    --         properties = {},
    --         types = { "bold" },
    --         operators = {},
    --       },
    --       transparent_background = false,
    --       show_end_of_buffer = false,
    --       custom_highlights = function(colors)
    --         return {
    --           NormalFloat = { bg = colors.crust },
    --           FloatBorder = { bg = colors.crust, fg = colors.crust },
    --           VertSplit = { bg = colors.base, fg = colors.surface0 },
    --           CursorLineNr = { fg = colors.mauve, style = { "bold" } },
    --           Pmenu = { bg = colors.crust, fg = "" },
    --           PmenuSel = { bg = colors.surface0, fg = "" },
    --           TelescopeSelection = { bg = colors.surface0 },
    --           TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },
    --           TelescopePromptPrefix = { bg = colors.surface0 },
    --           TelescopePromptNormal = { bg = colors.surface0 },
    --           TelescopeResultsNormal = { bg = colors.mantle },
    --           TelescopePreviewNormal = { bg = colors.crust },
    --           TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
    --           TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
    --           TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
    --           TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
    --           TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
    --           TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
    --           IndentBlanklineChar = { fg = colors.surface0 },
    --           IndentBlanklineContextChar = { fg = colors.surface2 },
    --           GitSignsChange = { fg = colors.peach },
    --           NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
    --           NvimTreeExecFile = { fg = colors.text },
    --         }
    --       end,
    --     })
    --
    --     ncvim.theme()
    --   end
    -- }
  },
  packer_bootstrap = false,
  lazy_bootstrap = true,
  pickers = {
    sessions = function()
      print("not implemented")
    end,
  },
  autocmds = {},

  post_install = {},

  custom = {},
}

ncvim.load_secret = function(secret_name)
  local handle = io.popen("pass " .. secret_name)
  if not handle then
    error("Failed to load secret '" .. secret_name .. "'. Error: handle cannot be created")
  end
  local result = handle:read("*a")
  handle:close()
  return result:gsub("\n", "")
end

ncvim.add_post_install = function(script)
  table.insert(ncvim.post_install, script)
end

require("ncvim.utils")

ncvim.add_autocmd = function(events, config)
  table.insert(ncvim.autocmds, {
    events = events,
    opts = config,
  })
end

ncvim.create_autocmds = function()
  for _, autocmd in ipairs(ncvim.autocmds) do
    vim.api.nvim_create_autocmd(autocmd.events, autocmd.opts)
  end
end
