local ok, conform = pcall(require, "conform")
if not ok then
	print("Error loading conform plugin")
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- javascript = { "eslint_d" },
	},
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
})
