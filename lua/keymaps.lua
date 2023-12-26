local function map(mode, lhs, rhs, opts)
    local options = { noremap=true, silent=true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Modes
--   "n" - normal mode
--   "i" - insert mode
--   "v" - visual mode
--   "x" - visual block mode
--   "t" - terminal mode
--   "c" - command mode

-----------------
-- NORMAL MODE --
-----------------

-- Hint: see ':h vim.map.set()'
-- Better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Quick save
map('n', '<leader>s', ':w<CR>')

-- Resize with arrows
-- delta: 2 lines
map('n', '<C-Up>', ':resize -2<CR>')
map('n', '<C-Down>', ':resize +2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')


-----------------
-- VISUAL MODE --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
local opts = { noremap = true }

-- shorten keymap function name
local keymap = vim.api.nvim_set_keymap

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window splitting
keymap("n", "<leader>\\", ":vertical split<CR>", opts)
keymap("n", "<leader>-", ":split<CR>", opts)

-- Code editing
  -- comments
  keymap("n", "<leader>/", "gcc", {})
  keymap("v", "<leader>/", "gc", {})

-- Nvim Tree
keymap("n", "<leader>E", ":NvimTreeToggle<CR>", {})


-- True Zen Mode
-- keymap("n", "<leader>zn", ":TZNarrow<CR>", opts)

-- Telescope
-- keymap("n", "<leader>ff", ":Telescope find_files<CR>", {})
-- keymap("n", "<leader>fg", ":Telescope live_grep<CR>", {})
-- keymap("n", "<leader>fb", ":Telescope buffers<CR>", {})
-- keymap("n", "<leader>fh", ":Telescope help_tags<CR>", {})

-------------
-- Command --
------------

-- reload neovim config without restarting
keymap("n", "<leader>!", ":source $MYVIMRC<CR><Esc>", {})

-- autoformat text and markdown files 
-- keymap("n", "<leader>ll", "gggqG", opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)
