local dap_configs = require('core.dap_config.adapters.js')

local setters = {}

setters.set_js_runner = function(runner)
    -- TODO: add dap config reload
    vim.g['test#javascript#runner'] = runner
    for _, language in ipairs({ "typescript", "javascript" }) do
        require("dap").configurations[language] = dap_configs[runner]
    end
end

local function set_defaults()
    setters.set_js_runner('mocha')
end

set_defaults()

return setters
