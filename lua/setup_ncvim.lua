-- require only if module exists
local function loadrequire(module)
  local function requiref(module_to_require)
    require(module_to_require)
  end
  pcall(requiref, module)
end

loadrequire('impatient')
loadrequire('plenary')

-- ncvim.config_packer()
ncvim.install_plugins_lazy()
ncvim.apply_mappings()
ncvim.create_autocmds()
if ncvim.theme then
  ncvim.theme()
end

for _, post_install_script in pairs(ncvim.post_install) do
  post_install_script()
end
