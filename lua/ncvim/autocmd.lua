local autocmd = ncvim.add_autocmd

ncvim.source_env = function()
  local path = require('plenary.path')
  local opened = vim.fn.getcwd()
  local env_path = path.new(opened, '.env.lua')
  local exist = path.is_file(env_path)
  if exist then
    vim.cmd('source ' .. path.expand(env_path))
  end
end

autocmd(
  {
    'DirChanged',
    'VimEnter',
  },
  {
    pattern = '*',
    callback = ncvim.source_env,
  }
)

autocmd(
  {
    'User'
  },
  {
    pattern = 'SessionLoadPost',
    callback = ncvim.source_env,
  }
)

autocmd(
  'BufWritePre',
  {
    pattern = '*',
    command = ':%s/\\s\\+$//e'
  }
)

-- local function reload_plugins()
-- cmd':Reload'
-- cmd':Restart'
-- cmd':PackerCompile'
-- cmd':PackerSync'
-- end

-- autocmd(
--     'BufWritePost',
--     {
--         pattern = '*/plugins.lua',
--         callback = reload_plugins,
--     }
-- )
