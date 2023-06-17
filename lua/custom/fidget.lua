return {
	"j-hui/fidget.nvim",
	enabled = false,
	branch = "legacy",
	event = "User FileOpened",
	config = function()
		require("fidget").setup({
			timer = {
				spinner_rate = 100,
				fidget_decay = 1000,
				task_decay = 1000,
			},
			window = {
				relative = "editor", -- where to anchor, either "win" or "editor"
				blend = 100, -- &winblend for the window
				zindex = nil, -- the zindex value for the window
				border = "none", -- style of border for the fidget window
			},
			text = {
				spinner = "bouncing_ball",
				done = "",
			},
		})
	end,
}
