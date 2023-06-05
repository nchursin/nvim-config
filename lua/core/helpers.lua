local telescope = require('telescope.builtin')

vim.g.helpers = {
    open_references = function()
        -- vim.lsp.buf.references()
        telescope.lsp_references()
    end,
}

