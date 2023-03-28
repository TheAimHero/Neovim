return {
	"gbprod/substitute.nvim",
	event = "User FileOpened",
	config = function()
		require("substitute").setup({
			on_substitute = require("yanky.integration").substitute(),
		})

		local opts = { noremap = true, silent = true }
		local keymap = vim.keymap.set

		--Substitute
		keymap("n", "s", "<cmd>lua require('substitute').operator()<cr>", opts)
		keymap("n", "ss", "<cmd>lua require('substitute').line()<cr>", opts)
		keymap("n", "S", "<cmd>lua require('substitute').eol()<cr>", opts)
		keymap("x", "s", "<cmd>lua require('substitute').visual()<cr>", opts)

		--Exchange
		keymap("n", "sx", "<cmd>lua require('substitute.exchange').operator()<cr>", opts)
		keymap("n", "sxx", "<cmd>lua require('substitute.exchange').line()<cr>", opts)
		keymap("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", opts)
		keymap("n", "sxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", opts)
	end,
}
