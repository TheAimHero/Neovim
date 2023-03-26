local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	require("custom.catppuccin"),
	require("custom.treesitter"),
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
	require("custom.lightbulb"),
	require("custom.various-textobjs"),
	require("custom.nvim-ts-rainbow2"),
	require("custom.mini"),
	require("custom.nvim-lspconfig"),
	require("custom.recorder"),
	require("custom.substitute"),
	require("custom.telescope"),
	require("custom.zen-mode"),
	require("custom.yanky"),
	require("custom.nvim-hlslens"),
	require("custom.lualine"),
	require("custom.markdown"),
	require("custom.persisted"),
	require("custom.alpha"),
	require("custom.window-picker"),

	{ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
	{
		"folke/trouble.nvim",
		config = true,
		cmd = "TroubleToggle",
		opts = { position = "right", width = 45, use_diagnostic_signs = true },
	},
	{
		"ErichDonGubler/lsp_lines.nvim",
		enabled = false,
		config = function()
			require("lsp_lines").setup()
		end,
	},
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
		event = "VeryLazy",
		config = true,
		opts = { default_action = "firefox", default_picker = "telescope" },
	},
	{
		"numToStr/Comment.nvim",
		config = true,
		event = "VeryLazy",
	},
	{
		"kylechui/nvim-surround",
		config = true,
		event = "VeryLazy",
	},
	{
		"michaelb/sniprun",
		cmd = "SnipRun",
		build = "bash ./install.sh",
		config = true,
	},
	{ "kkharji/sqlite.lua" },
	{ "famiu/bufdelete.nvim", event = "VeryLazy" },
	{
		"Wansmer/treesj",
		name = "treesj",
		config = true,
		opts = { max_join_length = 12000 },
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
	},
	{
		"simrat39/symbols-outline.nvim",
		config = true,
		cmd = "SymbolsOutline",
		opts = {
			width = 1,
			auto_close = true,
			auto_preview = false,
		},
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "lewis6991/impatient.nvim" },

	--Ui
	{
		"m4xshen/smartcolumn.nvim",
		config = true,
		event = "BufReadPost",
		opts = {
			disabled_filetypes = {
				"help",
				"lua",
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
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		config = function()
			require("fidget").setup({
				timer = {
					spinner_rate = 100,
					fidget_decay = 1000,
					task_decay = 1000,
				},
				text = {
					spinner = "bouncing_ball",
					done = "",
				},
			})
		end,
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
		event = "VeryLazy",
		opts = {
			extra_keymaps = true,
			extended_keymaps = false,
			hide_cursor = true,
			max_length = 100,
			scroll_limit = 100,
		},
	},

	--Git
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		opts = { preview_config = { border = "single" } },
		config = true,
	},
	{ "tpope/vim-fugitive", cmd = { "G", "Git" } },

	--Window
	{
		"anuvyklack/windows.nvim",
		config = true,
		event = "WinNew",
		cmd = { "WindowsEqualize", "WindowsMaximize" },
		dependencies = {
			{ "anuvyklack/middleclass" },
		},
		opts = {
			ignore = {
				filetype = {},
			},
		},
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
		cmd = {
			"ColorizerToggle",
			"ColorizerAttachToBuffer",
		},
		opts = { user_default_options = { names = false } },
	},

	--Colorschemes
	{
		"navarasu/onedark.nvim",
		event = "CmdlineEnter",
		dependencies = { "folke/tokyonight.nvim", "EdenEast/nightfox.nvim", "ray-x/starry.nvim" },
	},
}, require("custom.lazy"))
