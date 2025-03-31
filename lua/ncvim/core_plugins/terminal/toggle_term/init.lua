ncvim.plugin({
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    shade_terminals = false,
  }
})


ncvim.terminal = {
  open = function()
    local term = require('toggleterm.terminal').Terminal
    term:new().toggle()
  end
}
