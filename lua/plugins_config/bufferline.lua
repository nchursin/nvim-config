vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        mode = "tabs", -- set to "tabs" to only show tabpages instead
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = false,
    }
}
