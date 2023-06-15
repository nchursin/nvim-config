local map = vim.keymap.set

---@class KeyMapping
---@field mode string|string[]
---@field key_string string
---@field command string
---@param options? table<string, any>

---
---Maission control for NcVim
---
---@class NcVim
---@field mappings KeyMapping[]
ncvim = {
    mappings = {}
}

local function is_non_empty_array(to_test)
    return 0 ~= #to_test
end

---
---Adds keymappings to be set after everything else is loaded
---
---@param list_of_mappings KeyMapping[]
ncvim.add_mappings = function(list_of_mappings)
    if not is_non_empty_array(list_of_mappings) then
        return
    end
    for _, mapping in ipairs(list_of_mappings) do
        table.insert(ncvim.mappings, mapping)
    end
end

ncvim.apply_mappings = function()
    for _, mapping in ipairs(ncvim.mappings) do
        map(mapping.mode, mapping.key_string, mapping.command, mapping.options)
    end
end
