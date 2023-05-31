return {
	"kevinhwang91/nvim-hlslens",
	enabled = true,
	event = "User FileOpened",
	config = function()
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }
		require("hlslens").setup({ calm_down = true })
		keymap("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
		keymap("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
		keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
		keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
		keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
		keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)
		local kopts = { noremap = true, silent = true }
	end,
}
