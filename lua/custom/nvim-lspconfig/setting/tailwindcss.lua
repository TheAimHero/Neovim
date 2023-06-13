return function()
	require("lspconfig").tailwindcss.setup({
		on_attach = function(c, b)
			require("custom.nvim-lspconfig.handlers").lsp_keymaps(b)
			require("tailwindcss-colors").buf_attach(b)
		end,
		capabilities = require("custom.nvim-lspconfig.handlers").capabilities,
		filetypes = { "typescriptreact", "javascriptreact" },
		settings = {},
	})
end
