local autocmd = vim.api.nvim_create_autocmd

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

