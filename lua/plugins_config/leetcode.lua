local mappings_utils = require('utils.mappings_utils')
local map = mappings_utils.map
local default_opts = mappings_utils.default_opts

-- treat long lines as multiple lines
ncvim.add_mappings{
    {
        mode = 'n',
        key_string = '<leader>ll',
        command = ':LeetCodeList<CR>',
        options = default_opts,
    },
    {
        mode = 'n',
        key_string = '<leader>lt',
        command = ':LeetCodeTest<CR>',
        options = default_opts,
    },
    {
        mode = 'n',
        key_string = '<leader>ls',
        command = ':LeetCodeSubmit<CR>',
        options = default_opts,
    },
    {
        mode = 'n',
        key_string = '<leader>li',
        command = ':LeetCodeSignIn<CR>',
        options = default_opts,
    },
}

vim.g.leetcode_browser = 'chrome'
vim.g.leetcode_hide_paid_only = 1
vim.g.leetcode_solution_filetype = 'golang'

