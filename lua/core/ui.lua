local cmd = vim.cmd             -- execute Vim commands
local set_option = vim.api.nvim_set_option

-- Various UX
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
-- set('updatetime', 300)
-- set signcolumn=number
-- long lines
-- :set colorcolumn=120

-- Look and Feel settings
cmd([[
    syntax enable
    colorscheme onedark
    highlight SignColumn guibg=Black
    highlight SignColumn ctermbg=Black
]])

-- line numbers
set_option('number', true)
set_option('numberwidth', 4)
set_option('ruler', true)
set_option('signcolumn', 'yes')
-- auto switch line numbering
cmd([[
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
]])

-- Indentation
-- set autoindent
-- set cindent
-- set smartindent
set_option('expandtab', false)
set_option('tabstop', 4)
set_option('softtabstop', 4)
set_option('shiftwidth', 4)

-- Disable all bells and whistles
set_option('errorbells', false)
set_option('visualbell', false)

