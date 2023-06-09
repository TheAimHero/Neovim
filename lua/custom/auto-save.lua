return {
	"zoriya/auto-save.nvim",
	enable = false,
	event = "InsertLeave",
	config = function()
		require("auto-save").setup({
			execution_message = {
				message = function()
					return " "
				end,
				dim = 0.18,
				cleaning_interval = 0,
			},
			trigger_events = { "CmdlineEnter" },
			callbacks = {
				after_saving = function()
					-- ---@diagnostic disable-next-line: param-type-mismatch
					-- vim.notify("Saved at " .. vim.fn.strftime("%I:%M %p"), "info", { title = "Auto Save" })
				end,
			},
		})
	end,
}
