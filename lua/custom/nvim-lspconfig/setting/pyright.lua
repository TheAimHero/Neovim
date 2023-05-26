return function()
	require("lspconfig").pyright.setup({
		on_attach = function(c, b)
			c.server_capabilities.documentFormattingProvider = false
			require("custom.nvim-lspconfig.handlers").lsp_keymaps(b)
		end,
		capabilities = require("custom.nvim-lspconfig.handlers").capabilities,
		settings = {
			python = {},
		},
	})
end
