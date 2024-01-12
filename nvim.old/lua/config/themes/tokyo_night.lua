local tokyo_ok, tokyo_night = pcall(require, "tokyonight")

if not vim.g.colors_name == 'tokyonight' then
    return
elseif not tokyo_ok then
    print("Error loading the tokyo night color scheme")
    return
end

tokyo_night.setup({
	style = "storm",
	transparent = true,
	on_colors = function(colors)
		colors.fg_gutter = colors.orange
	end,

	on_highlights = function(highlights, colors)
		highlights.LineNr = {
			fg = colors.orange,
		}
	end,
})

if vim.g.theme == "tokyonight" then
	vim.cmd([[colorscheme tokyonight]])
end
