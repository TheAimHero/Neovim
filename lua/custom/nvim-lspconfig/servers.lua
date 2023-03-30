local servers = {
	"hls",
	"cssls",
	"marksman",
	"bashls",
	"asm_lsp",
}

--Diagnorstic configuration
require("custom.nvim-lspconfig.handlers").setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

--for servers with general configuration
for _, server in pairs(servers) do
	lspconfig[server].setup({
		on_attach = function(c, b)
			require("custom.nvim-lspconfig.handlers").lsp_keymaps(b)
		end,
		capabilities = require("custom.nvim-lspconfig.handlers").capabilities,
	})
end

--for servers with special configuration
require("custom.nvim-lspconfig.setting.tsserver")
require("custom.nvim-lspconfig.setting.lua_ls")
require("custom.nvim-lspconfig.setting.pyright")
require("custom.nvim-lspconfig.setting.html")
require("custom.nvim-lspconfig.setting.clangd")
require("custom.nvim-lspconfig.setting.nasm")
