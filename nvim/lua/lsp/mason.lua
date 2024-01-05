-- local mason_ok, mason = pcall(require, "mason")
-- if not mason_ok then
--     print("error loading mason")
--     return
-- end
--
-- local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
-- if not mason_lsp_ok then
--     print("error loading mason_lsp")
--     return
-- end
--

require("mason").setup({
	-- PATH = 'prepend',
	-- A list of servers to automatically install if they're not already installed
	ensure_installed = {
		-- 'cssmodules_ls',
		"eslint_d",
		-- 'html',
		-- 'jsonls',
		-- 'quick_lint_js',
		-- 'marksman',
		-- 'pylsp',
		"lua_ls",
		"tsserver",
	},
	automatic_install = true,

	handlers = {
		-- The first entry (without a key) will be the default handler
		-- and will be called for each installed server that doesn't have
		-- a dedicated handler.
		-- function (server_name) -- default handler (optional)
		-- require("lspconfig")[server_name].setup {}
		-- end,
		-- Next, you can provide a dedicated handler for specific servers.
		-- For example, a handler override for the `rust_analyzer`:
		-- function(server_name)
		--     require("lspconfig")[server_name].setup({})
		-- end,
		-- ["tsserver"] = function ()
		--     require("tsserver").setup {}
		-- end,
	},
})

require("mason-lspconfig").setup({})
