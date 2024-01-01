-- local formatter_ok, formatter = pcall(require, "formatter")
-- if not formatter_ok then
--     print("Error loading formatter plugin")
--     return
-- end

local util = require("formatter.util")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

-- enable rust auto format on buffer save
vim.g.rustfmt_command = "/home/kg/.cargo/bin/rustfmt"
vim.g.rustfmt_fail_silently = 0
vim.g.rustfmt_autosave = 1

local function prettier()
	return {
		exe = "prettier",
		args = {
			vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = true,
	}
end

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		javascript = { prettier },
		["javascript.jsx"] = { prettier },
		typescript = { prettier },
		["typescript.tsx"] = { prettier },
		rust = function()
			return {
				exe = "rustfmt",
				args = { "--emit=stdout", "--edition=2021" },
				stdin = true,
			}
		end,
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				-- if util.get_current_buffer_file_name() == "special.lua" then
				-- 	return nil
				-- end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
	},
})
