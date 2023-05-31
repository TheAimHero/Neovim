return {
	"ThePrimeagen/harpoon",
	dependencies = "nvim-lua/plenary.nvim",
  event = "BufReadPost",
	config = function()
		require("harpoon").setup({
			menu = { width = 60 },
			save_on_toggle = true,
			save_on_change = true,
			enter_on_sendcmd = false,
			tmux_autoclose_windows = false,
			excluded_filetypes = { "harpoon" },
			mark_branch = false,
			tabline = false,
			tabline_prefix = " ",
			tabline_suffix = " ",
		})
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local keymap = vim.keymap.set
		keymap("n", "]f", function() ui.nav_next() end)
		keymap("n", "[f", function() ui.nav_prev() end)
		keymap("n", "mf", mark.add_file)
		keymap("n", "ms", ui.toggle_quick_menu)
		keymap("n", "m1", function() ui.nav_file(1) end)
		keymap("n", "m2", function() ui.nav_file(2) end)
		keymap("n", "m3", function() ui.nav_file(3) end)
		keymap("n", "m4", function() ui.nav_file(4) end)
	end,
}
