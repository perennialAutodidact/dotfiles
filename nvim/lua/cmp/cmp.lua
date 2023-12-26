local cmp_ok, cmp = pcall(require, "nvim-cmp")
if not cmp_ok then
    print("Error loading cmp")
    return
end

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
        window = {
            -- completion = cmp.config.window.bordered()
            -- documentation = cmp.config.window.bordered()
        },
        mapping = {
            ['<Tab>'] = cmp.mapping(function(fallback)
                local col = vim.fn.col('.') - 1

                if cmp.visible() then
                    cmp.select_next_item(select_opts)
                elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                  fallback()
                else
                  cmp.complete()
                end
            end, {'i', 's'}),

            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item(select_opts)
                else
                  fallback()
                end
            end, {'i', 's'}),
        },
        sources = cmp.config.sources({
            -- { name = "lspconfig" },
            { name = "luasnip" },
        }, {
            { name = "buffer" }
        })

    }
})
