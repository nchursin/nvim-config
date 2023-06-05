local cmd = vim.cmd

local function config()
    require('telescope').setup()
    require('telescope').load_extension('dap')
end

config()

vim.g.helpers.open_references_custom = function()
    cmd[[<cmd> Telescope lsp_references<cr>]]
end

