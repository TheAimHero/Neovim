---@diagnostic disable: lowercase-global
local wkl = require("which-key")
local autocmd = vim.api.nvim_create_autocmd

vim.cmd("autocmd BufNew * lua setKeybinds()")
function setKeybinds()
	local fileTy = vim.api.nvim_buf_get_option(0, "filetype")
	local opts = { prefix = "<localleader>", buffer = 0 }

	if fileTy == "markdown" then
		wkl.register({
			["R"] = { "<cmd>MarkdownPreviewToggle<cr>", "Preview Markdown" },
			["ut"] = { "<cmd>lua require('markdown-togglecheck').toggle()<cr>", "Toggle Checkbox" },
		}, opts)
	else
		wkl.register({
			["R"] = { "<cmd>lua M.Run()<cr>", "Run Code" },
		}, opts)
	end
end
