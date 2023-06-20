ncvim.plugin({
  'tpope/vim-dadbod',
  requires = {
    'kristijanhusak/vim-dadbod-ui',
  },
  config = function()
    vim.g.db_ui_dotenv_variable_prefix = 'NVIM_DB_'
  end
})

ncvim.add_mappings {
  {
    mode = 'n',
    key_string = '<C-s>',
    command = ':DBUIToggle<CR>'
  }
}
