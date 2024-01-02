vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a"
vim.api.nvim_set_option("updatetime", 300)

--Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- UI config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true

-- Searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Colors
-- require('everforest').load()
vim.o.background = "dark"
vim.g.transparent_enabled = true
vim.g.theme = "gruvbox"

-- Font (currently set in wezterm config)
-- vim.g.guifont = 'Fira\\ Code'
