return function()
	require("lspconfig").lua_ls.setup({
		on_attach = function(c, b)
			c.server_capabilities.documentFormattingProvider = false
			vim.lsp.buf.inlay_hint(b, true)
			require("custom.nvim-lspconfig.handlers").lsp_keymaps(b)
		end,
		capabilities = require("custom.nvim-lspconfig.handlers").capabilities,
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		log_level = 2,
		single_file_support = true,
		settings = {
			Lua = {
				hint = { enable = true },
				runtime = { version = "LuaJIT" },
				diagnostics = { globals = { "vim", "lvim" } },
				workspace = { library = vim.api.nvim_get_runtime_file("", true) },
				telemetry = { enable = false },
			},
		},
	})
end
