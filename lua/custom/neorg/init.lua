return {
	"nvim-neorg/neorg",
	ft = "norg",
	cmd = "Neorg",
	build = ":Neorg sync-parsers",
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {
				config = {
					icon_preset = "diamond",
					icons = {
						todo = {
							done = { icon = "" },
							pending = { icon = "" },
						},
					},
				},
			},
			["core.itero"] = {},
			["core.journal"] = {},
			["core.esupports.indent"] = {},
			["core.summary"] = {},
			-- @todo: doesn't work
			["core.ui.calendar"] = {},
			--    ["core.keybinds"] = {config={hook=function ()
			--      keybinds.map('norg','n','gt?',)
			--
			-- end}},
			["core.integrations.nvim-cmp"] = {},
			["core.integrations.treesitter"] = {},
			["core.completion"] = {
				config = { engine = "nvim-cmp" },
			},
			["core.dirman"] = {
				config = {
					workspaces = require("custom.neorg.workspaces"),
					default_workspace = "Neorg",
				},
			},
		},
	},
}
