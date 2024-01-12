-- package.path = './lua;' .. package.path

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("lazy").setup({ { import="config" } })

-- local modules = {
 	-- "autocomplete.cmp_config",
	-- "autocomplete.snippets",
	-- "autocomplete.luasnip",

	-- "code_formatting.config",
	-- "code_formatting.conform",

	-- "clipboard",

	-- "config.keymaps",
	-- "lualine",
	-- "nvim_tree.nvim_tree",
	-- "nvim_tree.icons",
	-- "options",
	-- "plugins",

	-- "lazy",

	-- "lsp.mason",
	-- "lsp.lsp",
	-- "lsp.rust-tools",

	-- "markdown_preview",

	-- "telescope_config",
	-- "themes.everforest",
	-- "themes.leaf",
	-- "themes.tokyo_night",

	-- "transparency",

	--"themes.everforest",
	-- "themes.leaf",
	-- "themes.tokyo_night",
	-- "themes.gruvbox",
	-- "transparency",

	-- "treesitter.highlight_args",
	-- "treesitter.indent_blankline",
	-- "treesitter.rainbow_delimiters",
	-- "treesitter.transparent_config",
	-- "treesitter.treesitter",
-- }

-- for i in ipairs(modules) do
--	local module = modules[i]
--
--	require(module)
--end
--
local M = {}

function M.setup(opts)
	require("config")
end

return M
