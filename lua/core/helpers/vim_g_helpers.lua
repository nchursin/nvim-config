-- TODO: check if this is needed at all with telescope-ui-select

local telescope = require('telescope.builtin')

vim.g.helpers = {
  open_references = function()
    -- vim.lsp.buf.references()
    telescope.lsp_references()
  end,

  open_implementations = function()
    -- vim.lsp.buf.implementation()
    telescope.lsp_implementations()
  end,

  open_definitions = function()
    -- vim.lsp.buf.definition()
    telescope.lsp_definitions()
  end,
}
