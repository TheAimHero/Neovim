return {
	"NFrid/markdown-togglecheck",
	ft = "markdown",
	dependencies = { "NFrid/treesitter-utils", commit = "8505c912e29388d2ebb92cf22e91e55052a861cd" },
	Config = function()
		require("markdown-togglecheck").setup({
			-- create empty checkbox on item without any while toggling
			create = true,
			-- remove checked checkbox instead of unckecking it while toggling
			remove = false,
		})
	end,
}
