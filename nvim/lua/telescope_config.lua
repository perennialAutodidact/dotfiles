local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
    print("Error loading telescope")
    return
end

local builtin_ok, builtin = pcall(require, "telescope.builtin")
if not builtin_ok then
    print("Error loading telescope.builtin")
    return
end

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

