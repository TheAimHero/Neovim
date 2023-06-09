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

	require("custom.todo-comments"),
	require("custom.colorscheme"),
	require("custom.leet_buddy"),
	require("custom.hbac"),
	require("custom.Noice"),
	require("custom.codeium"),
	require("custom.Outline"),
	require("custom.web_dev"),
	require("custom.goto-preview"),
	require("custom.neorg"),
	require("custom.harpoon"),
	require("custom.treesitter"),
	require("custom.gitsigns"),
	require("custom.ufo"),
	require("custom.completion"),
	require("custom.diffview"),
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
	require("custom.nvim-lspconfig"),
	require("custom.statuscol"),
	require("custom.recorder"),
	require("custom.substitute"),
	require("custom.Telescope"),
	require("custom.autopairs"),
	require("custom.lualine"),
	require("custom.alpha"),
	require("custom.neo_tree"),
	require("custom.quick_scope"),
	require("custom.trouble"),

	{ "tpope/vim-obsession" },

	{ "nvim-lua/plenary.nvim", lazy = true },

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
	--Ui
	{
		"nvim-zh/colorful-winsep.nvim",
		enabled = true,
		config = true,
		event = "WinNew",
		-- opts = { highlight = { fg = "#FF966C" } },
	},

	--Git
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
}, require("custom.lazy"))
