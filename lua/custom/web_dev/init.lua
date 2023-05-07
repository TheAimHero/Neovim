return {
	{
		"windwp/nvim-ts-autotag",
		ft = { "javascriptreact", "javascript", "html" },
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
}
