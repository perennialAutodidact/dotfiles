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

-- vim.cmd("autocmd Colorscheme * highlight NvimTreeNormal guibg=NONE guifg=#9da5b3")

return {
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        init = function()
            require('nvim-tree').setup({
                 on_attach = on_attach,
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
       end,
    },
    {
        "kyazdani42/nvim-web-devicons",
        init = function()
            local web_devicons_ok, web_devicons = pcall(require, "nvim-web-devicons")
            if not web_devicons_ok then
                return
            end

            local material_icon_ok, material_icon = pcall(require, "nvim-material-icon")
            if not material_icon_ok then
                return
            end

            material_icon.setup({
                view = {
                    adaptive_size = true,
                }
            })

            web_devicons.setup({
                override = material_icon.get_icons(),
            })
        end,
    },
}
