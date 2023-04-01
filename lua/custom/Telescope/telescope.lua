return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = "0.1.x",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "prochri/telescope-all-recent.nvim" },
		{ "tsakirist/telescope-lazy.nvim" },
		{ "paopaol/telescope-git-diffs.nvim" },
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				-- Default configuration for telescope goes here:
				-- config_key = value,
				winblend = 20,
				pumblend = 20,
				file_ignore_patterns = {
					".git/",
					".cache",
					"%.o",
					"%.a",
					"%.out",
					"%.class",
					"%.pdf",
					"%.mkv",
					"%.mp4",
					"%.zip",
				},
				path_display = { truncate = 5 },
				hidden = true,
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = { ["q"] = actions.close },
				},
			},

			pickers = {
				find_files = {
					find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--color=auto" },
					path_display = { "truncate = 5" },
				},
				live_grep = { additional_args = { "--hidden", "--ignore-case" } },
				buffers = { path_display = { "tail" } },
			},

			extensions = {
				rooter = {
					enable = true,
					patterns = { ".git" },
					debug = false,
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})

		local extension = require("telescope").load_extension
		--telescope extensions require
		extension("fzf")
		extension("projects")
		extension("lazy")
		extension("git_diffs")
		extension("notify")
	end,
}
