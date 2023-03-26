require("lspconfig").asm_lsp.setup({
	on_attach = function(c, b)
		c.server_capabilities.documentFormattingProvider = false
		require("custom.nvim-lspconfig.handlers").lsp_keymaps(b)
		require("lsp_signature").on_attach({
			floating_window = false,
			hint_enable = true,
			hint_prefix = "",
		}, b)
	end,
	capabilities = require("custom.nvim-lspconfig.handlers").capabilities,
	cmd = { "asm-lsp" },
	filetypes = { "asm", "vmasm" },
	single_file_support = true,
})
