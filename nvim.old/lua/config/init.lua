local M = {}

local defaults = {
    
}

function M.load(name)
    local function _load(module)
        local ok, loaded_module = pcall(require, module)
        if not ok then
            print("Error loading " .. module .. " module")
            return
        end
    end
end

function M.setup()
    _load("config.options")
end
