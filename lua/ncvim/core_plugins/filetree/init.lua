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

ncvim.add_mappings {
  {
    mode = 'n',
    key_string = '<leader>n',
    command = ':NERDTreeFocus<CR>',
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<C-n>',
    command = ':NERDTreeFocus<CR>',
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<leader><C-n>',
    command = ':NERDTree<CR>',
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<C-t>',
    command = ':NERDTreeToggle<CR>',
    options = silent_noremap,
  },
  {
    mode = 'n',
    key_string = '<C-f>',
    command = ':NERDTreeFind<CR>',
    options = silent_noremap,
  },
}
