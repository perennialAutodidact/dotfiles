local leaf_ok, leaf = pcall(require, "leaf")
if not leaf_ok then
    print("Error loading leaf color scheme")
    return
end

leaf.setup({
    transparent = true,
    underline_style = "undercurl",
    contrast = "high"
})
