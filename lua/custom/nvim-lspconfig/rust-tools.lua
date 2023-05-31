return {
	"simrat39/rust-tools.nvim",
	enabled = false,
	ft = "rust",
	config = function()
		require("rust-tools").setup({
			tools = { inlay_hints = { auto = false } },
			server = {
				on_attach = function(c, bufnr)
					require("lsp-inlayhints").on_attach(c, bufnr)
					require("custom.nvim-lspconfig.handlers").lsp_keymaps(bufnr)
					-- local keymap = vim.keymap.set
					-- local opts = { buffer = bufnr }
					-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
					-- keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
					-- keymap("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", opts)
					-- keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
				end,
			},
		})
	end,
}
