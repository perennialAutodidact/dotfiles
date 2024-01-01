-- package.path = './lua;' .. package.path

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local modules = {
    "autocomplete.cmp_config",
    -- "autocomplete.snippets",
    -- "autocomplete.luasnip",

    "code_formatting",

    "keymaps",
    "lualine",
    "nvim_tree.nvim_tree",
    "nvim_tree.icons",
    "options",
    "plugins",

    "lsp.mason",
    "lsp.lsp",
    "lsp.rust-tools",

    "markdown_preview",

    "telescope_config",

    "themes.everforest",
    "themes.leaf",
    "themes.tokyo_night",
    "transparency",

    "treesitter.highlight_args",
    "treesitter.indent_blankline",
    "treesitter.rainbow_delimiters",
    "treesitter.transparent_config",
    "treesitter.treesitter",
}


for i in ipairs(modules) do
    local module = modules[i]

    require(module)
end
