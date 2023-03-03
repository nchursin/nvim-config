local mappings_utils = require('utils.mappings_utils')
local map = mappings_utils.map
local default_opts = mappings_utils.default_opts

-- treat long lines as multiple lines
map('n', '<leader>ll', ':LeetCodeList<CR>', default_opts)
map('n', '<leader>lt', ':LeetCodeTest<CR>', default_opts)
map('n', '<leader>ls', ':LeetCodeSubmit<CR>', default_opts)
map('n', '<leader>li', ':LeetCodeSignIn<CR>', default_opts)

vim.g.leetcode_browser = 'chrome'
vim.g.leetcode_hide_paid_only = 1
vim.g.leetcode_solution_filetype = 'golang'

