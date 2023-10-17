ncvim.plugin({
  'tpope/vim-dadbod',
  requires = {
    'kristijanhusak/vim-dadbod-ui',
  },
  config = function()
    vim.g.db_ui_dotenv_variable_prefix = 'NVIM_DB_'
  end
})

ncvim.plugin({
  'kristijanhusak/vim-dadbod-completion',
  requires = {
    'tpope/vim-dadbod',
  },
  config = function()
    vim.cmd [[
      autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
    ]]
  end
})

ncvim.add_mappings {
  {
    mode = 'n',
    key_string = '<C-s>',
    command = ncvim.db.toggle,
  }
}

ncvim.add_autocmd(
  {
    "FileType",
  },
  {
    pattern = { 'sql', 'mysql', 'plsql' },
    callback = function()
      require('cmp').setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } })
    end,
  }
)
