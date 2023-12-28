-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


local function on_attach(bufnr)
    local api = require("nvim-tree.api")
    local function opts(desc) 
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    api.config.mappings.default_on_attach(bufnr)
end

vim.cmd("autocmd Colorscheme * highlight NvimTreeNormal guibg=NONE guifg=#9da5b3")

require("nvim-tree").setup({
    -- on_attach = on_attach,
    sort_by = "case_sensitive",
    view = {
        width = 30,
        side = "left",
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})
