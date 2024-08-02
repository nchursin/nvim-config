-- local set_option = vim.api.nvim_set_option

local function basename(str)
  local name = string.gsub(str, "(.*/)(.*)", "%2")
  return name
end

local function get_cwd_basename()
  return basename(vim.fn.getcwd())
end

ncvim.set_title = function()
  vim.cmd("set title")
  local cwd_name = get_cwd_basename()
  vim.opt.titlestring = cwd_name
end


ncvim.add_autocmd(
  {
    'DirChanged',
    'VimEnter',
  },
  {
    callback = ncvim.set_title,
  }
)

ncvim.add_autocmd(
  {
    'User'
  },
  {
    pattern = 'SessionLoadPost',
    callback = ncvim.set_title,
  }
)
