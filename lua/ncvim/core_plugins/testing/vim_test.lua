ncvim.plugin({
  'vim-test/vim-test',
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local cmd = vim.cmd

    cmd [[
let test#javascript#mocha#file_pattern = '\v((test|spec)s?/.*|(spec))\.(js|jsx|coffee|ts)$'
let test#javascript#webdriverio#file_pattern = '\v((test|spec)s?/.*|(test|spec))\.(js|jsx|coffee|ts)$'
]]


    vim.g['test#echo_command'] = 1
    vim.g['test#strategy'] = "neovim"
    vim.g['test#javascript#mocha#executable'] = 'mocha'
    -- vim.g['test#javascript#runner'] = 'jest'
    vim.g['test#javascript#runner'] = 'mocha'
    -- vim.g['test#javascript#runner'] = 'webdriverio'
    vim.g['test#python#runner'] = 'pytest'

    -- vim.g['test#go#gotest#executable'] = 'grc go test'
    vim.g['test#go#gotest#executable'] = 'function echo_and_exec() { echo "$@" && $@ }; echo_and_exec grc go test'
  end
})
