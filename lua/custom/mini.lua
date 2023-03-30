return {
	"echasnovski/mini.nvim",
	branch = "main",
	event = { "CmdlineEnter", "User FileOpened" },
	config = function()
		require("mini.pairs").setup({ modes = { insert = true, command = true, terminal = true } })

		require("mini.ai").setup()

		require("mini.jump").setup({
			delay = { highlight = 50, idle_stop = 2000 },
			mappings = { repeat_jump = "" },
		})

		require("mini.indentscope").setup({
			draw = { delay = 20 },
			mappings = {
				-- Textobjects
				object_scope = "",
				object_scope_with_border = "",
				-- Motions (jump to respective border line; if not present - body line)
				goto_top = "",
				goto_bottom = "",
			},
			options = { indent_at_cursor = false, try_as_border = true },
			symbol = "│",
		})

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
