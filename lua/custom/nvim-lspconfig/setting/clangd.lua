local lspconfig = require("lspconfig.configs")
local clangd_capabilities = require("custom.nvim-lspconfig.handlers").capabilities
clangd_capabilities.textDocument.semanticHighlighting = true
clangd_capabilities.offsetEncoding = "utf-8"

lspconfig.clangd.setup({
	on_attach = function(c, b)
		c.server_capabilities.documentFormattingProvider = false
		require("custom.nvim-lspconfig.handlers").lsp_keymaps(b)
	end,
	capabilities = clangd_capabilities,
	cmd = { "clangd" },
	init_options = {
		clangdFileStatus = true,
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
})
