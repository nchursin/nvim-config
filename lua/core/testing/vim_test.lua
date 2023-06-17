local cmd = vim.cmd

cmd [[
let test#javascript#mocha#file_pattern = '\v((test|spec)s?/.*|(spec))\.(js|jsx|coffee|ts)$'
let test#javascript#webdriverio#file_pattern = '\v((test|spec)s?/.*|(test|spec))\.(js|jsx|coffee|ts)$'
]]


vim.g['test#strategy'] = "neovim"
vim.g['test#javascript#mocha#executable'] = 'mocha'
-- vim.g['test#javascript#runner'] = 'jest'
vim.g['test#javascript#runner'] = 'mocha'
-- vim.g['test#javascript#runner'] = 'webdriverio'
vim.g['test#python#runner'] = 'pytest'

vim.g['test#go#gotest#executable'] = 'grc go test'
