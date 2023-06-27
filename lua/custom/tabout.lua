return {
	"abecodes/tabout.nvim",
	config = function()
		require("tabout").setup({
			tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
			backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
			act_as_tab = true, -- shift content if tab out is not possible
			act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
			default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
			default_shift_tab = "<C-d>", -- reverse shift default action,
			enable_backwards = true, -- well ...
			completion = true, -- if the tabkey is used in a completion pum
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = "`", close = "`" },
				{ open = "(", close = ")" },
				{ open = "[", close = "]" },
				{ open = "{", close = "}" },
			},
			ignore_beginning = true,
			exclude = {},
		})
	end,
	dependencies = { "nvim-treesitter", "nvim-cmp" },
}, 
{
	"declancm/cinnamon.nvim",
	enabled = false,
	config = true,
	event = "User FileOpened",
	opts = {
		extra_keymaps = true,
		extended_keymaps = false,
		hide_cursor = true,
		max_length = 100,
		scroll_limit = 100,
	},
}
