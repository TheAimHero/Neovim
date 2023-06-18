return {
	"rmagatti/goto-preview",
	lazy = true,
	keys = { { "gpd", mode = { "n" } } },
	ft = { "cpp", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	config = function()
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }
		require("goto-preview").setup({
			width = 120,
			height = 15,
			border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
			default_mappings = false,
			debug = false,
			opacity = nil,
			resizing_mappings = false,
			post_open_hook = function()
				vim.wo.number = false
			end,
			references = {
				telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
			},
			focus_on_open = false,
			dismiss_on_move = true,
			force_close = true,
			bufhidden = "wipe",
			stack_floating_preview_windows = true,
			preview_window_title = { enable = true, position = "left" },
		})
		keymap("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
		keymap("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
	end,
}
