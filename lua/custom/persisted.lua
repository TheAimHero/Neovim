return {
	"olimorris/persisted.nvim",
	dependencies = "telescope.nvim",
	cmd = { "SessionSave" },
	keys = { { " ul", "<cmd>Telescope persisted<cr>", desc = "List sessions" } },
	config = function()
		require("persisted").setup({
			save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
			command = "VimLeavePre", -- the autocommand for which the session is saved
			silent = true, -- silent nvim message when sourcing session file
			use_git_branch = true, -- create session files based on the branch of the git enabled repository
			autosave = true, -- automatically save session files when exiting Neovim
			autoload = false, -- automatically load the session for the cwd on Neovim startup
			follow_cwd = true, -- change session file name to match current working directory if it changes
			allowed_dirs = {
				"~/Workspace",
			},
			telescope = { -- options for the telescope extension
				reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
			},
		})
		require("telescope").load_extension("persisted")
	end,
}
