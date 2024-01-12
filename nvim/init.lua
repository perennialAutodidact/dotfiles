local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local config_modules = {
	-- "clipboard",
	"keymaps",
	"options",
}

for i in ipairs(config_modules) do
	local module = config_modules[i]

	require("config." .. module)
end

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.autocomplete" },
		{ import = "plugins.code" },
		{ import = "plugins.editor" },
		{ import = "plugins.editor.themes" },
		{ import = "plugins.lsp" },
		{ import = "plugins.nvim_tree" },
		{ import = "plugins.telescope" },
		{ import = "plugins.treesitter" },
	},
})
