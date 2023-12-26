local status_ok, tree_sitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

tree_sitter.setup({
    ensure_installed = { 'javascript', 'typescript', 'lua', 'python', 'html', 'css', 'scss' },

    sync_install = true,

    highlight = {
        enable = true,

    }
})

