return {
	"Exafunction/codeium.vim",
	event = "User FileOpened",
	enabled = true,
	config = function()
		vim.g.codeium_disable_bindings = 1
		-- vim.g.codeium_manual = true
		local opts = { noremap = true, silent = true }
		local keymap = vim.keymap.set
		keymap("i", "<C-d>", function()
			return vim.fn["codeium#Complete"]()
		end, { expr = true }, opts)
		keymap("i", "<C-f>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true }, opts)
		keymap("i", "<C-n>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true }, opts)
		keymap("i", "<C-p>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true }, opts)
		keymap("i", "<C-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true }, opts)
	end,
}
