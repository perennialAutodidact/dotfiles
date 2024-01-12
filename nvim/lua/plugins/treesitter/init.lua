return {
	"nvim-treesitter/nvim-treesitter",
    init = function() 
        local status_ok, tree_sitter = pcall(require, "nvim-treesitter.configs")
        if not status_ok then
            return
        end

        tree_sitter.setup({
            ensure_installed = {
                'javascript',
                'typescript',
                'lua',
                'python',
                'html',
                'css',
                'scss',
                'rust',
                'toml'
            },

            sync_install = true,

            highlight = {
                enable = true,
            }
        })
    end,
    build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
    end,
}
