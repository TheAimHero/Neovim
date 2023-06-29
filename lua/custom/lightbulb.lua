return {
	"kosayoda/nvim-lightbulb",
	commit = "ca5b44a8efffb5fec1963ccd21f25ec04cc778b7",
	event = "LspAttach",
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
