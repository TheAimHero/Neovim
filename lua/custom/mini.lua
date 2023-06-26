return {
	"echasnovski/mini.nvim",
	branch = "main",
	event = { "User FileOpened" },
	config = function()
		require("mini.ai").setup()

		require("mini.cursorword").setup()

		require("mini.comment").setup()

		require("mini.move").setup()

		require("mini.bracketed").setup({
			jump = { suffix = "", options = {} },
			location = { suffix = "", options = {} },
			undo = { suffix = "", options = {} },
			yank = { suffix = "", options = {} },
		})
	end,
}
