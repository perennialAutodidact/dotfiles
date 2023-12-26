local ibl_ok, ibl = pcall(require, "ibl")
if not ibl_ok then
    return
end

local hooks_ok, ibl_hooks = pcall(require, "ibl.hooks")
if not hooks_ok then
    return
end

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

ibl_hooks.register(ibl_hooks.type.HIGHLIGHT_SETUP, function ()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

ibl_hooks.register(ibl_hooks.type.SCOPE_HIGHLIGHT, ibl_hooks.builtin.scope_highlight_from_extmark)

ibl.setup({
    indent = { highlight = highlight },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
})
