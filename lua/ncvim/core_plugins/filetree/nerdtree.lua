local silent_noremap = { noremap = true, silent = true }

ncvim.plugin({
  'preservim/nerdtree',
  requires = {
    'ryanoasis/vim-devicons',
    'PhilRunninger/nerdtree-visual-selection'
  },
  config = function()
    vim.g.NERDTreeShowHidden = 1
  end
})

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
