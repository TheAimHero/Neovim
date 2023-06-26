return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	enabled = true,
	event = "User FileOpened",
	config = function()
		require("todo-comments").setup({
			signs = false,
			sign_priority = 8,
			keywords = {
				FIX = { icon = " ", color = "fix", alt = { "fix" } },
				TODO = { icon = " ", color = "todo", alt = { "todo" } },
				HACK = { icon = " ", color = "hack", alt = { "hack" } },
				WARN = { icon = " ", color = "warn", alt = { "warn" } },
				PERF = { icon = "󰉁 ", color = "perf", alt = { "perf" } },
				NOTE = { icon = " ", color = "note", alt = { "note" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "test", "pass", "fail" } },
			},
			gui_style = { fg = "ITALIC", bg = "BOLD" },
			merge_keywords = false,
			highlight = {
				multiline = false,
				multiline_pattern = "^.",
				multiline_context = 10,
				before = "",
				keyword = "wide",
				after = "",
				pattern = [[.*\@<(KEYWORDS)>:]],
				comments_only = true,
				max_line_len = 400,
				exclude = {},
			},
			colors = {
				fix = { "#F38BA8" },
				todo = { "#89B4FA" },
				hack = { "#89DCEB" },
				perf = { "#A6E3A1" },
				warn = { "#FAB387" },
				note = { "#808080" },
				test = { "#C6A0F6" },
			},

      
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				pattern = [[\b(KEYWORDS):]],
			},
		})
	end,
}
