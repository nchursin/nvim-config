local cmd = vim.cmd             -- execute Vim commands

-- vim-test
cmd ( [[
    let test#strategy = "neovim"
    let g:test#javascript#mocha#file_pattern = '\v((test|spec)s?/.*|(spec))\.(js|jsx|coffee|ts)$'
    let g:test#javascript#webdriverio#file_pattern = '\v((test|spec)s?/.*|(test))\.(js|jsx|coffee|ts)$'
    let g:test#javascript#mocha#executable = 'mocha'
    " let g:test#javascript#runner = 'jest'
    let g:test#javascript#runner = 'mocha'
    " let g:test#javascript#runner = 'webdriverio'
    let test#python#runner = 'pytest'
    let test#strategy = "neovim"
]] )
