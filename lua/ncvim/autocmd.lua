local autocmd = ncvim.add_autocmd
local path = require('plenary.path')

local function get_path(str, sep)
  sep = sep or '/'
  return str:match("(.*" .. sep .. ")")
end

local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

ncvim.source_env = function()
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
