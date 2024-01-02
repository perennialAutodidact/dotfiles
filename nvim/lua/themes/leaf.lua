local leaf_ok, leaf = pcall(require, "leaf")
if not vim.g.colors_name == "leaf" then
    return
elseif not leaf_ok then
    print("Error loading leaf color scheme")
    return
end

leaf.setup({
	transparent = true,
	underline_style = "undercurl",
	contrast = "high",
})

if vim.g.theme == "leaf" then
	vim.cmd([[colorscheme leaf]])
end
