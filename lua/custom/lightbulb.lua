return {
	"kosayoda/nvim-lightbulb",
	ft = { "javascript" },
	dependencies = "antoinemadec/FixCursorHold.nvim",
	config = function()
		require("nvim-lightbulb").setup({
			ignore = {},
			sign = {
				enabled = false,
				-- Priority of the gutter sign
				priority = 10,
			},
			float = {
				enabled = false,
				text = "💡",
			},
			virtual_text = {
				enabled = true,
				text = "💡",
				hl_mode = "combine",
			},
			status_text = {
				enabled = false,
				text = "💡",
				text_unavailable = "",
			},
			autocmd = {
				enabled = true,
				pattern = { "*" },
				events = { "CursorHold", "CursorHoldI" },
			},
		})
	end,
}
