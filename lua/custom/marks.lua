return {
	"chentoast/marks.nvim",
	keys = { { "m", modes = { "n" } }, { "dm", modes = { "n" } } },
	config = function()
		require("marks").setup({
			default_mappings = false,
			builtin_marks = {},
			cyclic = true,
			force_write_shada = false,
			refresh_interval = 250,
			sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
			excluded_filetypes = {},
			bookmark_0 = {
				sign = "⚑",
				virt_text = "",
				annotate = false,
			},
			mappings = {
				next = "]m",
				prev = "[m",
				delete = "dm",
				set_bookmark = "ma",
				delete_bookmark = "dma",
				next_bookmark0 = "]a",
				prev_bookmark0 = "[a",
				annotate = "ma",
				delete_buf = "dm<space>",
				preview = "m:",
				set = "m",
			},
		})
	end,
}
