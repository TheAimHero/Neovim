return {
	{
		"windwp/nvim-ts-autotag",
		ft = { "typescriptreact", "javascriptreact", "javascript", "html" },
	},
	{
		"NvChad/nvim-colorizer.lua",
		name = "colorizer",
		-- NOTE: This is for inline virtual text not yet merged
		-- commit = "72aba5511b6af8405f26c3922c12a17bf8a680d1",
		cmd = { "ColorizerToggle", "ColorizerAttachToBuffer" },
		config = function()
			require("colorizer").setup({
				filetypes = { "*" },
				user_default_options = {
					RGB = true,
					RRGGBB = true,
					names = true,
					RRGGBBAA = true,
					AARRGGBB = true,
					rgb_fn = true,
					hsl_fn = true,
					css = true,
					css_fn = true,
					mode = "background",
					-- NOTE: This is for inline virtual text
					-- mode = "inline",
					tailwind = "both",
					sass = { enable = true, parsers = { "css" } },
					virtualtext = " ■",
					always_update = false,
				},
				buftypes = {},
			})
		end,
	},
}
