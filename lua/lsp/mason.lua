local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    print("error loading mason")
    return
end

local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
    print("error loading mason_lsp")
    return
end

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    log_level = vim.log.levels.DEBUG
})

require("mason-lspconfig").setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = {
        'cssmodules_ls',
        'eslint',
        'html',
        'jsonls',
        'quick_lint_js',
        'marksman',
        'pylsp',
        'lua_ls',
        'tsserver',
    },
    automatic_install = true,
})

