return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = "0.1.x",
	dependencies = {
		{ "nvim-telescope/telescope-dap.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "debugloop/telescope-undo.nvim" },
		{ "xiyaowong/telescope-emoji.nvim" },
		{ "ghassan0/telescope-glyph.nvim" },
		{ "prochri/telescope-all-recent.nvim" },
		{ "tsakirist/telescope-lazy.nvim" },
		{ "paopaol/telescope-git-diffs.nvim" },
		{ "dhruvmanila/telescope-bookmarks.nvim" },
		{
			dir = "~/Workspace/telescope-code-fence.nvim",
			build = "make install",
		},
		{
			"adoyle-h/lsp-toggle.nvim",
			config = true,
			branch = "master",
			opts = { create_cmds = true, telescope = true },
		},
		{ "MaximilianLloyd/adjacent.nvim" },
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
				adjacent = {
					level = 5, -- default
				},
				rooter = {
					enable = true,
					patterns = { ".git" },
					debug = false,
				},
				undo = {
					side_by_side = true,
					mappings = {
						i = {
							["<C-u>"] = require("telescope-undo.actions").restore,
						},
					},
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				file_browser = {
					theme = "ivy",
					initial_mode = "normal",
					sorting_strategy = "descending",
					cwd_to_path = false,
					path = "%:p:h",
					hidden = true,
					hijack_netrw = true,
				},
				emoji = {
					action = function(emoji)
						vim.fn.setreg("*", emoji.value)
						print([[Press p or "*p to paste this emoji]] .. emoji.value)
						-- insert emoji when picked
						vim.api.nvim_put({ emoji.value }, "c", false, true)
					end,
				},
				glyph = {
					action = function(glyph)
						vim.fn.setreg("*", glyph.value)
						print([[Press p or "*p to paste this glyph]] .. glyph.value)
						-- insert glyph when picked
						vim.api.nvim_put({ glyph.value }, "c", false, true)
					end,
				},
				bookmarks = {
					selected_browser = "firefox",
					full_path = "/home/Vedant/.mozilla/firefox/a96czeoi.default/places.sqlite",
					profile_name = "default-release",
					url_open_command = "xdg-open",
				},
			},
		})

		local extension = require("telescope").load_extension
		--telescope extensions require
		extension("fzf")
		extension("yank_history")
		extension("file_browser")
		extension("projects")
		extension("undo")
		extension("glyph")
		extension("emoji")
		extension("lazy")
		extension("git_diffs")
		extension("bookmarks")
		extension("adjacent")
		extension("notify")
		extension("persisted")
	end,
}
