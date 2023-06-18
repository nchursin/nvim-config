local default_opts = require('utils.mappings_utils').default_opts

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
    options = default_opts,
  },
  {
    mode = 'n',
    key_string = '<C-n>',
    command = ':NERDTreeFocus<CR>',
    options = default_opts,
  },
  {
    mode = 'n',
    key_string = '<leader><C-n>',
    command = ':NERDTree<CR>',
    options = default_opts,
  },
  {
    mode = 'n',
    key_string = '<C-t>',
    command = ':NERDTreeToggle<CR>',
    options = default_opts,
  },
  {
    mode = 'n',
    key_string = '<C-f>',
    command = ':NERDTreeFind<CR>',
    options = default_opts,
  },
}
