-- TODO: check if this is needed at all with telescope-ui-select

ncvim.config = {
  path = vim.fn.stdpath('config'),

  open = function()
    vim.cmd('cd ' .. ncvim.config.path)
  end
}

ncvim.lsp = {
  references = function()
    require('telescope.builtin').lsp_references()
  end,

  implementations = function()
    require('telescope.builtin').lsp_implementations()
  end,

  definitions = function()
    require('telescope.builtin').lsp_definitions()
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

ncvim.db = {
  toggle = function()
    vim.cmd 'DBUIToggle'
  end,
}

ncvim.ui = {
  panels = {
    minimap = function()
      vim.cmd 'MinimapToggle'
    end,

    symbois = function()
      vim.cmd 'SymbolsOutline'
    end,

    todo = function()
      vim.cmd 'TodoLocList keywords=TODO,FIX,FIXME'
    end
  }
}
