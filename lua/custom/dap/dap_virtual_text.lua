return {
	"theHamsta/nvim-dap-virtual-text",
	config = function()
		require("nvim-dap-virtual-text").setup({
			enabled = true, -- enable this plugin (the default)
			enabled_commands = false, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
			highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
			highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
			show_stop_reason = true, -- show stop reason when stopped for exceptions
			commented = false, -- prefix virtual text with comment string
			only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
			all_references = true, -- show virtual text on all all references of the variable (not only definitions)
			clear_on_continue = true, -- clear virtual text on "continue" (might cause flickering when stepping)
			virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

		})
	end,
	lazy = true,
}
