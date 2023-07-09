local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	require("custom.catppuccin"),
	require("custom.Noice"),
	require("custom.neorg"),
	require("custom.treesitter"),
	require("custom.gitsigns"),
	require("custom.ufo"),
	require("custom.completion"),
	require("custom.diffview"),
	require("custom.which-key"),
	require("custom.notify"),
	require("custom.project"),
	require("custom.bufferline"),
	require("custom.various-textobjs"),
	require("custom.nvim-ts-rainbow2"),
	require("custom.mini"),
	require("custom.statuscol"),
	require("custom.substitute"),
	require("custom.Telescope"),
	require("custom.zen-mode"),
	require("custom.yanky"),
	require("custom.autopairs"),
	require("custom.lualine"),
	require("custom.alpha"),
	require("custom.neo_tree"),
	require("custom.quick_scope"),
	require("custom.trouble"),

	{ "tpope/vim-obsession" },

	{ "nvim-lua/plenary.nvim", lazy = true },

	--General
	{
		"axieax/urlview.nvim",
		cmd = "UrlView",
		config = true,
		opts = { default_action = "firefox", default_picker = "telescope" },
	},
	{
		"numToStr/Comment.nvim",
		enabled = false,
		config = true,
		-- event = "User FileOpened",
		keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
	},
	{
		"kylechui/nvim-surround",
		config = true,
		event = "User FileOpened",
	},
	{ "lukas-reineke/indent-blankline.nvim", event = "User FileOpened" },
	{ "kkharji/sqlite.lua", lazy = true },
	{ "famiu/bufdelete.nvim", cmd = { "Bdelete" } },
	{
		"Wansmer/treesj",
		name = "treesj",
		config = true,
		opts = { max_join_length = 12000 },
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "tpope/vim-fugitive", cmd = { "G", "Git" } },

	--Window
	{
		"anuvyklack/windows.nvim",
		commit = "4dcfd82374726097a05bc1fe3b3b6e934be184eb",
		event = "WinNew",
		cmd = { "WindowsEqualize", "WindowsMaximize" },
		dependencies = {
			{ "anuvyklack/middleclass" },
		},
		config = function()
			require("windows").setup({
				ignore = {
					buftype = { "quickfix" },
					filetype = { "Outline", "NvimTree", "neo-tree", "undotree", "gundo" },
				},
			})
		end,
	},

	--Replace
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},

	--Colorschemes
	{
		"olimorris/onedarkpro.nvim",
		lazy = "true",
		dependencies = {
			"LunarVim/lunar.nvim",
			"folke/tokyonight.nvim",
			"EdenEast/nightfox.nvim",
			"ray-x/starry.nvim",
		},
		opts = {
			highlights = { LspInlayHint = { link = "Comment" } },
		},
	},
}, require("custom.lazy"))
