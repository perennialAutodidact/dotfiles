local fn = vim.fn

-- Automatically install Packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_repo_url = "https://github.com/wbthomason/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		packer_repo_url,
		install_path,
	})
	print("Installing packer. Restart Neovim.")
	vim.cmd([[packadd packer.nvim]])
end

-- Reload Neovim whenever plugins.lua is saved
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost ~/.config/nvim/lua/plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so first use doesn't error out
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install plugins here
return packer.startup(function(use)
	-- packer
	use({ "wbthomason/packer.nvim" })

	-- lualine
	use({ "nvim-lualine/lualine.nvim" })

	-- colors
	use({ "daschw/leaf.nvim" })
	use({ "sainnhe/sonokai" })
	use({ "folke/tokyonight.nvim" })
	use({ "kartikp10/noctis.nvim", requires = { "rktjmp/lush.nvim" } })
	use({
		"neanias/everforest-nvim",
		config = function()
			require("everforest").setup()
		end,
	})
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "xiyaowong/transparent.nvim" })

	-- comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- rainbow delimiters
	use({ "HiPhish/rainbow-delimiters.nvim" })

	-- indent indication
	use({ "lukas-reineke/indent-blankline.nvim" })

	-- highlight args
	use({ "m-demare/hlargs.nvim" })

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- code formatting / linting
	use({ "mhartington/formatter.nvim" })
	use({ "stevearc/conform.nvim" })
	use({ "mfussenegger/nvim-lint" })

	-- auto-complete & intellisense
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "neovim/nvim-lspconfig" })

	use({
		"hrsh7th/nvim-cmp",
		-- event="InsertEnter",
		-- config=function()
		--    require("autocomplete.cmp_config")
		-- end
	})
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-cmdline" })

	-- snippets
	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
		run = "make install_jsregexp",
	})
	use({ "rafamadriz/friendly-snippets" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "simrat39/rust-tools.nvim" })

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
