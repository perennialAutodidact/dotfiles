local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then
    return
end

local loaders_ok, loaders = pcall(require, "luasnip.loaders.from_vscode")
if not loaders_ok then
    return
end

loaders.lazy_load()

