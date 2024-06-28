local cmd = vim.cmd
local set_option = vim.api.nvim_set_option

-- line numbers
set_option('number', true)
set_option('numberwidth', 4)
set_option('ruler', true)
set_option('signcolumn', 'yes')
-- auto switch line numbering
cmd([[
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
]])

-- Indentation
-- set autoindent
-- set cindent
-- set smartindent
set_option('expandtab', true)
set_option('tabstop', 4)
set_option('softtabstop', 4)
set_option('shiftwidth', 4)

-- Disable all bells and whistles
set_option('errorbells', false)
set_option('visualbell', false)

set_option('updatetime', 1000)

require('ncvim.ui.themes')
require('ncvim.ui.ui_select')
require('ncvim.ui.telescope')
require('ncvim.ui.statusline')
require('ncvim.ui.tabline')
require('ncvim.ui.cursorline')
require('ncvim.ui.welcome_screen')

local function dumpTable(table, depth)
  if depth == nil then
    depth = 0
  end
  if (depth > 200) then
    print("Error: Depth > 200 in dumpTable()")
    return
  end
  for k, v in pairs(table) do
    if (type(v) == "table") then
      print(string.rep("  ", depth) .. k .. ":")
      dumpTable(v, depth + 1)
    else
      print(string.rep("  ", depth) .. k .. ": ", v)
    end
  end
end


ncvim.debug = {
  dump = dumpTable,
}
