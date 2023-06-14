local mappings_utils = require('utils.mappings_utils')
local map = mappings_utils.map
local opts = mappings_utils.default_opts
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd

TestingModes = {
    NORMAL = 'NORMAL',
    TDD = 'TDD',
    TCR = 'TCR',
}
vim.g.tdd_mode = TestingModes.NORMAL
vim.g.tdd_set_mode = function (mode)
    vim.g.tdd_mode = mode
    print('Testing mode now is: ' .. vim.g.tdd_mode)
end

map('n', 'tm1', ':lua vim.g.tdd_set_mode("' .. TestingModes.NORMAL .. '")<CR>', opts)
map('n', 'tm2', ':lua vim.g.tdd_set_mode("' .. TestingModes.TDD .. '")<CR>', opts)

autocmd(
    'BufWritePost',
    {
        pattern = '*',
        callback = function()
            -- print('Testing mode is: ' .. vim.g.tdd_mode)
            if TestingModes.NORMAL == vim.g.tdd_mode then
                return
            end

            cmd'TestLast'
        end
    }
)

