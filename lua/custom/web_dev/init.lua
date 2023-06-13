return {
	{
		"windwp/nvim-ts-autotag",
		ft = { "typescriptreact", "javascriptreact", "javascript", "html" },
	},
	{
		"MaxMEllon/vim-jsx-pretty",
		enabled = false,
		ft = { "javascriptreact" },
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = true,
		name = "colorizer",
		cmd = { "ColorizerToggle", "ColorizerAttachToBuffer" },
		opts = { user_default_options = { names = true } },
	},
	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		lazy = true,
		enabled = false,
		cmd = "TailwindColorsToggle",
		module = "tailwindcss-colors",
		config = function()
			require("tailwindcss-colors").setup()
		end,
	},
}
