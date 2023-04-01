if vim.fn.has("wsl") then
	return {}
else
	return {
		"dhruvmanila/telescope-bookmarks.nvim",
		keys = { { " ub", "<cmd>Telescope bookmarks<cr>", desc = "Browser Bookmarks" } },
		config = function()
			require("telescope").setup({
				extensions = {
					bookmarks = {
						selected_browser = "firefox",
						full_path = "/home/Vedant/.mozilla/firefox/a96czeoi.default/places.sqlite",
						profile_name = "default-release",
						url_open_command = "xdg-open",
					},
				},
			})
      require("telescope").load_extension("bookmarks")
		end,
	}
end
