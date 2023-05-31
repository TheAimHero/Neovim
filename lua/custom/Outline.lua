return {
	"simrat39/symbols-outline.nvim",
	cmd = "SymbolsOutline",
	config = function()
		require("symbols-outline").setup({
			highlight_hovered_item = true,
			show_guides = true,
			auto_preview = false,
			position = "right",
			relative_width = true,
			width = 15,
			auto_close = false,
			show_numbers = false,
			show_relative_numbers = false,
			show_symbol_details = false,
			preview_bg_highlight = "Pmenu",
			autofold_depth = 1,
			auto_unfold_hover = true,
			fold_markers = { "", "" },
			wrap = false,
			keymaps = {
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
      },
		})
	end,
}