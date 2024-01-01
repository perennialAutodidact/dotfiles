local tokyo_ok, tokyo_night = pcall(require, "tokyo-night")
if not tokyo_ok then
    print("Error loading the tokyo night color scheme")
    return
end

print("TOKYO NIGHT")

tokyo_night.setup({
    style = "storm",
    transparent = true,
    on_colors = function(colors)
        colors.fg_gutter = colors.orange
    end,

    on_highlights = function(highlights, colors)
        highlights.LineNr = {
            fg = colors.orange
        }
    end

})
