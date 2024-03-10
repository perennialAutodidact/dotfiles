local ok, lint = pcall(require, "lint")
if not ok then
	print("Error loading lint plugin")
	return
end

lint.linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})
