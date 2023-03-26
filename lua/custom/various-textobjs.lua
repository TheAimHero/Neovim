return {
	"chrisgrieser/nvim-various-textobjs",
	event = "VeryLazy",
	config = function()
		require("various-textobjs").setup({
			useDefaultKeymaps = true,
			lookForwardLines = 100,
		})

		vim.keymap.set("n", "gx", function()
			require("various-textobjs").url() -- select URL
			local foundURL = vim.fn.mode():find("v") -- only switches to visual mode if found
			local url
			if foundURL then
				vim.cmd.normal('"zy') -- retrieve URL with "z as intermediary
				url = vim.fn.getreg("z")

				local opener
				if vim.fn.has("macunix") == 1 then
					opener = "open"
				elseif vim.fn.has("linux") == 1 then
					opener = "xdg-open "
				elseif vim.fn.has("win64") == 1 or fn.has("win32") == 1 then
					opener = "start"
				end
				vim.cmd("silent ! " .. opener .. "'" .. url .. "'")
			else
				-- if not found in proximity, search whole buffer via urlview.nvim instead
				vim.cmd.UrlView("buffer")
			end
		end, { desc = "Smart URL Opener" })
	end,
}
