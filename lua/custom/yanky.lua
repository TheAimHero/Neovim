return {
	"gbprod/yanky.nvim",
	dependencies = { "telescope.nvim", "sqlite.lua" },
	event = "User FileOpened",
	config = function()
		local utils = require("yanky.utils")
		local mapping = require("yanky.telescope.mapping")
		require("yanky").setup({
			system_clipboard = {
				sync_with_ring = true,
			},
			picker = {
				select = { action = nil },
				telescope = {
					use_default_mappings = false,
					mappings = {
						default = mapping.set_register(utils.get_default_register()),
					},
				},
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
		require("telescope").load_extension("yank_history")
	end,
}
