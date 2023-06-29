return {
	"olimorris/onedarkpro.nvim",
	lazy = true,
	dependencies = { "lunar.nvim", "tokyonight.nvim", "nightfox.nvim", "starry.nvim" },
	config = function()
		require("onedarkpro").setup({
			options = { transparency = false, cursorline = false },
			highlights = {
        LspInlayHint = { link = "Comment" },
        ["@property"]={ bg = "", fg = "#FF7377" },
        ["@variable"]={ bg = "", fg = "#FF7377" }
      },
		})
	end,
}
