return {
	"echasnovski/mini.nvim",
	branch = "main",
	event = { "User FileOpened" },
	config = function()
		require("mini.ai").setup()

		require("mini.cursorword").setup()

		require("mini.move").setup()

		require("mini.bracketed").setup({
			buffer = { suffix = "b", options = {} },
			comment = { suffix = "c", options = {} },
			conflict = { suffix = "x", options = {} },
			diagnostic = { suffix = "d", options = {} },
			file = { suffix = "", options = {} },
			indent = { suffix = "i", options = {} },
			jump = { suffix = "", options = {} },
			location = { suffix = "", options = {} },
			oldfile = { suffix = "", options = {} },
			quickfix = { suffix = "", options = {} },
			treesitter = { suffix = "t", options = {} },
			undo = { suffix = "", options = {} },
			window = { suffix = "", options = {} },
			yank = { suffix = "", options = {} },
		})
	end,
}
