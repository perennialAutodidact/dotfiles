local tokyo_ok, tokyo_night = pcall(require, "tokyo-night")
if not tokyo_ok then
    print("Error loading the tokyo night color scheme")
    return
end

tokyo_night.setup({
    style = "storm",
    transparent = true,
})
