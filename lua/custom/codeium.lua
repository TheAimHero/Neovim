return {
	"Exafunction/codeium.vim",
	event = "User FileOpened",
	enabled = true,
	config = function()
		vim.g.codeium_disable_bindings = 1
		-- vim.g.codeium_filetypes = { TelescopePrompt = false }
		vim.cmd([[let g:codeium_filetypes = {
    \ "TelescopePrompt": v:false,
    \ "typescript": v:true,
    \ }]])
		local opts = { noremap = true, silent = true }
		local keymap = vim.keymap.set
		keymap("i", "<C-d>", function()
			return vim.fn["codeium#Complete"]()
		end, { silent = true, expr = true }, opts)
		keymap("i", "<C-f>", function()
			return vim.fn["codeium#Accept"]()
		end, { silent = true, silent = true, expr = true }, opts)
		keymap("i", "<C-n>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { silent = true, expr = true }, opts)
		keymap("i", "<C-p>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { silent = true, expr = true }, opts)
		keymap("i", "<C-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { silent = true, expr = true }, opts)
	end,
}
