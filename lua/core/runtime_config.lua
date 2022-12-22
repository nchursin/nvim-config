local setters = {}

setters.set_js_runner = function(runner)
    vim.g['test#javascript#runner'] = runner
end

local function set_defaults()
    setters.set_js_runner('mocha')
end

set_defaults()

return setters
