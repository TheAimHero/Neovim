local function diff_source()
	---@diagnostic disable-next-line: undefined-field
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end
return {
	"nvim-lualine/lualine.nvim",
	event = "User FileOpened",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = " " },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "b:gitsigns_head", icon = "" },
					{
						"diff",
						source = diff_source,
						diff_color = {
							added = "DiagnosticSignOk",
							modified = "DiagnosticSignWarn",
							removed = "DiagnosticSignError",
						},
						on_click = function()
							vim.cmd("silent G add %")
						end,
					},
					{
						-- function()
						-- 	return vim.fn["codeium#GetStatusString"]()
						-- end,
					},
				},
				lualine_c = { { require("recorder").recordingStatus } },
				lualine_x = {
					{
						"diagnostics",
						on_click = function()
							vim.cmd("Trouble document_diagnostics")
						end,
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
					{
						"os.date('%I:%M %p')",
						icons_enabled = true,
						color = { fg = "#ff9e64" },
						icon = "",
					},
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = { fg = "#ff9e64" },
						on_click = function()
							vim.cmd(":Lazy update")
						end,
					},
				},
				lualine_y = { "filetype" },
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "location" },
				lualine_y = { "" },
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
