local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

return {
	"s1n7ax/nvim-window-picker",
	event = "WinNew",
	name = "window-picker",
	config = function()
		require("window-picker").setup()
		keymap("n", "<leader>wW", function()
			local window = require("window-picker").pick_window({
				include_current_win = false,
			})
			local target_buffer = vim.fn.winbufnr(window)
			-- Set the target window to contain current buffer
			vim.api.nvim_win_set_buf(window, 0)
			-- Set current window to contain target buffer
			vim.api.nvim_win_set_buf(0, target_buffer)
		end)
		keymap("n", "<leader>ww", function()
			local picked_window_id = require("window-picker").pick_window({
				include_current_win = true,
			}) or vim.api.nvim_get_current_win()
			vim.api.nvim_set_current_win(picked_window_id)
		end)
	end,
}
