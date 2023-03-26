return {
	"rcarriga/nvim-notify",
	enabled = true,
	event = "VeryLazy",
	config = function()
		vim.notify = require("notify")
		require("notify").setup({
			background_colour = "Normal",
			fps = 1,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			minimum_width = 20,
			max_height = 5,
			render = "default",
			stages = "static",
			timeout = 2000,
			top_down = true,
		})
	end,
}
