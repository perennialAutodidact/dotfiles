-- Set different settings for different languages' LSP
-- LSP list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- How to use setup({}): https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--     - the settings table is sent to the LSP
--     - on_attach: a lua callback function to run after LSP attaches to a given buffer
local lspconfig = require("lspconfig")

vim.lsp.set_log_level("debug")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["tsserver"].setup({
	capabilities = capabilities,
})

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						},
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					},
				},
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end,
})

lspconfig["rust_analyzer"].setup({
	capabilities = capabilities,
	settings = {
		["rust_analyzer"] = {
			check = {
				command = "clippy",
			},
			diagnostics = {
				enable = true,
			},
		},
		cargo = {
			allFeatures = true,
		},
	},
})

-- local function eslint_config_exists()
-- 	local eslintrc = vim.fn.glob(".eslintrc*", false, 1)
-- 	if not vim.tbl_isempty(eslintrc) then
-- 		return true
-- 	end
-- 	if vim.fn.filereadable("package.json") then
-- 		if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
-- 			return true
-- 		end
-- 	end
-- 	return false
-- end
--
-- local eslint = {
-- 	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
-- 	lintStdin = true,
-- 	lintFormats = { "%f:%l:%c: %m" },
-- 	lintIgnoreExitCode = true,
-- 	formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
-- 	formatStdin = true,
-- }
--
-- lspconfig["efm"].setup({
-- 	on_attach = function(client)
-- 		client.resolved_capabilities.document_formatting = true
-- 		client.resolved_capabilities.goto_definition = false
-- 		set_lsp_config(client)
-- 	end,
-- 	root_dir = function()
-- 		if not eslint_config_exists() then
-- 			return nil
-- 		end
-- 		return vim.fn.getcwd()
-- 	end,
-- 	settings = {
-- 		languages = {
-- 			javascript = { eslint },
-- 			javascriptreact = { eslint },
-- 			["javascript.jsx"] = { eslint },
-- 			typescript = { eslint },
-- 			["typescript.tsx"] = { eslint },
-- 			typescriptreact = { eslint },
-- 		},
-- 	},
-- 	filetypes = {
-- 		"javascript",
-- 		"javascriptreact",
-- 		"javascript.jsx",
-- 		"typescript",
-- 		"typescript.tsx",
-- 		"typescriptreact",
-- 	},
-- })

-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local bufopts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
	end,
})
