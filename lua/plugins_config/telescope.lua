local function config()
    require('telescope').setup()
    require('telescope').load_extension('dap')
end

config()
