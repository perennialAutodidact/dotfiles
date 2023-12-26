local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
    print("error loading cmp")
    return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then
    print("error loading luasnip")
    return
end

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    -- snippet engine is required
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end

    },

    --window settings
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window,
    },

    formatting = {
        fields = {"abbr", "menu"},
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[Lsp]",
                luasnip = "[Luasnip]",
                buffer = "[File]",
                path = "[Path]"
            })[entry.source.name]
            return vim_item
        end
    },

    mapping = cmp.mapping.preset.insert({
        -- Use <C-b/f> to scroll the docs
        ['<C-b>'] = cmp.mapping.scroll_docs( -4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- Use <C-k/j> to switch in items
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        -- Use <CR>(Enter) to confirm selection
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- A super tab
        -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
    --     ["<Tab>"] = cmp.mapping(function(fallback)
    --         -- Hint: if the completion menu is visible select next one
    --         if cmp.visible() then
    --             cmp.select_next_item()
    --         elseif has_words_before() then
    --             cmp.complete()
    --         else
    --             fallback()
    --         end
    --     end, { "i", "s" }), -- i - insert mode; s - select mode
    --     ["<S-Tab>"] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --             cmp.select_prev_item()
    --         elseif luasnip.jumpable( -1) then
    --             luasnip.jump( -1)
    --         else
    --             fallback()
    --         end
    --     end, { "i", "s" }),
    }),
    
    sources = {
        cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
        }, {
            name = 'buffer'
        })
    },

    -- set configuration for a specific filetype
    cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
            { name = "git" },
        }, {
            { name = "buffer"}
        })
    })

    --
})
