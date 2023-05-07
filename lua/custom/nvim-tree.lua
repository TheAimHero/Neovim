return {
	"nvim-tree/nvim-tree.lua",
	event = "user DirOpened",
	cmd = { "NvimTreeToggle" },
	enabled = false,
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})
	end,
}
