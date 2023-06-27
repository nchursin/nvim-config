ncvim.config_packer()
ncvim.install_plugins()
ncvim.apply_mappings()
ncvim.create_autocmds()
if ncvim.theme then
  ncvim.theme()
end
