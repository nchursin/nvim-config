local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

ncvim.packer_bootstrap = ensure_packer()

if ncvim.packer_bootstrap then
  require('core.plugins')
  require('packer').sync()
end

-- require only if module exists
local function loadrequire(module)
  local function requiref(module_to_require)
    require(module_to_require)
  end
  pcall(requiref, module)
end
loadrequire('impatient')
