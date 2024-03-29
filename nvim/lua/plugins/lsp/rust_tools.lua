return {
 "simrat39/rust-tools.nvim",
 init = function() 
    local rt_ok, rt = pcall(require, "rust-tools")
    if not rt_ok then
        print("Error loading rust tools plugin")
        return
    end


    rt.setup({
        server = {
            on_attach = function(_, bufnr)
                 -- Hover actions
                 vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                 -- Code action groups
                 vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
        }
    })
 end,
}
