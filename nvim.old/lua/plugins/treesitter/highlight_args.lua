local ok, hl_args = pcall(require, "hlargs")
if not ok then
    print("Error loading highlight args plugin")
    return
end

hl_args.setup({})
