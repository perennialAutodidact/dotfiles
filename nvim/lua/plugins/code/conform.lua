return {
	"stevearc/conform.nvim",
	-- event = { "PreBufRead", "BufNewFile" },
	config = function()
		local ok, conform = pcall(require, "conform")
		if not ok then
			print("Error loading conform plugin")
			return
		end

		local eslint_d = function()
			return {
				inherit = false,
				command = "eslint_d",
				args = { "--fix" },
			}
		end

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { eslint_d },
			},
			format_on_save = {
				async = false,
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>F", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
