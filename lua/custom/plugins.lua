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
	require("custom.marks"),
	require("custom.treesitter"),
	require("custom.gitsigns"),
	require("custom.ssr"),
	require("custom.ufo"),
	require("custom.tsnode-marker"),
	require("custom.completion"),
	require("custom.diffview"),
	require("custom.barbecue"),
	require("custom.flatten"),
	require("custom.which-key"),
	require("custom.dap"),
	require("custom.toggleterm"),
	require("custom.notify"),
	require("custom.auto-save"),
	require("custom.project"),
	require("custom.bufferline"),
	require("custom.various-textobjs"),
	require("custom.nvim-ts-rainbow2"),
	require("custom.mini"),
	require("custom.fidget"),
	require("custom.nvim-lspconfig"),
	require("custom.statuscol"),
	require("custom.recorder"),
	require("custom.substitute"),
	require("custom.Telescope"),
	require("custom.zen-mode"),
	require("custom.yanky"),
	require("custom.nvim-hlslens"),
	require("custom.autopairs"),
	require("custom.lualine"),
	require("custom.markdown"),
	require("custom.persisted"),
	require("custom.alpha"),
	require("custom.window-picker"),
	require("custom.neo_tree"),
	require("custom.quick_scope"),
	require("custom.trouble"),

	{ "nvim-lua/plenary.nvim", lazy = true },

	{
		"shellRaining/hlchunk.nvim",
		enabled = false,
		config = function()
			require("hlchunk").setup({
				line_num = { enable = false },
				blank = { enable = false },
			})
		end,
	},

	--General
	{
		"axieax/urlview.nvim",
		cmd = "UrlView",
		config = true,
		opts = { default_action = "firefox", default_picker = "telescope" },
	},
	{
		"numToStr/Comment.nvim",
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
	{
		"michaelb/sniprun",
		cmd = "SnipRun",
		build = "bash ./install.sh",
		config = true,
	},
	{ "kkharji/sqlite.lua", lazy = true },
	{ "famiu/bufdelete.nvim", cmd = { "Bdelete" } },
	{
		"Wansmer/treesj",
		name = "treesj",
		config = true,
		opts = { max_join_length = 12000 },
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
	},
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		config = function()
			require("symbols-outline").setup({
				relative_width = true,
				width = 25,
				auto_close = false,
			})
		end,
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	--Ui
	{
		"m4xshen/smartcolumn.nvim",
		config = true,
		event = "User FileOpened",
		opts = {
			disabled_filetypes = {
				"help",
				"text",
				"markdown",
				"alpha",
				"help",
				"man",
				"fugitive",
				"git",
			},
		},
	},
	{
		"nvim-zh/colorful-winsep.nvim",
		config = true,
		event = "WinNew",
		opts = { highlight = { fg = "#FF966C" } },
	},

	{
		"declancm/cinnamon.nvim",
		enabled = true,
		config = true,
		event = "User FileOpened",
		opts = {
			extra_keymaps = true,
			extended_keymaps = false,
			hide_cursor = true,
			max_length = 100,
			scroll_limit = 100,
		},
	},

	--Git
	{ "tpope/vim-fugitive", cmd = { "G", "Git" } },

	--Window
	{
		"anuvyklack/windows.nvim",
		event = "WinNew",
		cmd = { "WindowsEqualize", "WindowsMaximize" },
		dependencies = {
			{ "anuvyklack/middleclass" },
		},
		config = function()
			require("windows").setup({
				ignore = {
					buftype = { "quickfix", "nofile" },
					filetype = { "Outline", "NvimTree", "neo-tree", "undotree", "gundo" },
				},
			})
		end,
	},

	--Preview
	{
		"rmagatti/goto-preview",
		lazy = true,
		ft = "cpp",
		config = true,
	},

	--Replace
	{ "smjonas/inc-rename.nvim", config = true, event = "VeryLazy" },

	--Web
	{
		"NvChad/nvim-colorizer.lua",
		config = true,
		name = "colorizer",
		cmd = { "ColorizerToggle", "ColorizerAttachToBuffer" },
		opts = { user_default_options = { names = false } },
	},

	--Colorschemes
	{
		"navarasu/onedark.nvim",
		keys = {
			{ " Ts", "<cmd>Telescope colorscheme<cr>" },
			{ " Tp", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>" },
		},
		dependencies = {
			"LunarVim/lunar.nvim",
			"folke/tokyonight.nvim",
			"telescope.nvim",
			"EdenEast/nightfox.nvim",
			"ray-x/starry.nvim",
		},
	},
}, require("custom.lazy"))
