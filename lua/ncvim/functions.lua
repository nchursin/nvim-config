-- TODO: check if this is needed at all with telescope-ui-select

local telescope = require('telescope.builtin')

ncvim.lsp = {
  references = function()
    telescope.lsp_references()
  end,

  implementations = function()
    telescope.lsp_implementations()
  end,

  definitions = function()
    telescope.lsp_definitions()
  end,

  signature_help = function()
    vim.lsp.buf.signature_help()
  end,
}

ncvim.filetree = {
  toggle = function()
    vim.cmd 'NERDTreeToggle'
  end,

  focus = function()
    vim.cmd 'NERDTreeFocus'
  end,

  current_file = function()
    vim.cmd 'NERDTreeFind'
  end,

  restart = function()
    vim.cmd 'NERDTree'
  end,
}
