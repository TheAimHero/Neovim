local clangd_capabilities = require("custom.nvim-lspconfig.handlers").capabilities
clangd_capabilities.textDocument.semanticHighlighting = true
clangd_capabilities.offsetEncoding = "utf-8"
return function()
	require("lspconfig").clangd.setup({
		on_attach = function(c, b)
			c.server_capabilities.documentFormattingProvider = false
			vim.lsp.buf.inlay_hint(b, true)
			require("custom.nvim-lspconfig.handlers").lsp_keymaps(b)
		end,
		capabilities = clangd_capabilities,
		cmd = { "clangd" },
		init_options = {
			clangdFileStatus = true,
			usePlaceholders = true,
			completeUnimported = true,
			semanticHighlighting = false,
		},
	})
end
