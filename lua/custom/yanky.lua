return {
	"gbprod/yanky.nvim",
	event = "VeryLazy",
	config = function()
		require("yanky").setup({
			system_clipboard = {
				sync_with_ring = true,
			},
			ring = {
				history_length = 100,
				storage = "sqlite",
				sync_with_numbered_registers = true,
				cancel_event = "update",
			},
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 500,
			},
		})
	end,
}
