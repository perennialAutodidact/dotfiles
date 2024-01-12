-- local ok, lazy = pcall(require, "lazy")
-- if not ok then
-- print("Error loading lazy plugin")
-- return
-- end

local plugins = {}
local opts = {}

require("lazy").setup(plugins, opts)
