return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
    require("custom.dap.telescope-dap"),
    require("custom.dap.dap_virtual_text"),
		"rcarriga/nvim-dap-ui",
	},
	config = function()
    require("custom.dap.nvim-dap")
		require("custom.dap.dapui_auto")
	end,
}
