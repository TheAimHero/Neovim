return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		{ "rcarriga/nvim-dap-ui" },
		{
			"theHamsta/nvim-dap-virtual-text",
			config = true,
			lazy = true,
			opts = {
				all_references = true,
				enabled_commands = false,
			},
		},
		config = function()
			require("custom.dap.nvim-dap")
			require("custom.dap.dapui_auto")
		end,
	},
}
