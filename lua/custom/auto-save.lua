return {
	-- "Pocco81/auto-save.nvim",
	"zoriya/auto-save.nvim",
	event = "InsertEnter",
	config = function()
		require("auto-save").setup({
			execution_message = {
				message = function()
					return " "
				end,
          dim = 0.18,
          cleaning_interval = 0,
			},
			callbacks = {
				after_saving = function()
					vim.notify("Saved at " .. vim.fn.strftime("%I:%M %p"), "info", { title = "Auto Save" })
				end,
			},
		})
	end,
}
