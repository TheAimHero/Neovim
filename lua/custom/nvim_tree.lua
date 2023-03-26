require("nvim-tree").setup({
  update_cwd = true,
	sort_by = "case_sensitive",
	auto_reload_on_write = false,

	hijack_directories = {
		enable = false,
	},

	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},

	git = {
		enable = true,
		ignore = false,
		timeout = 200,
	},

	view = {
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "single",
				width = 30,
				height = 50,
				row = 1,
				col = 1,
			},
		},

		mappings = {
			list = {
				{ key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
				{ key = "h", action = "close_node" },
				{ key = "v", action = "vsplit" },
				{ key = "C", action = "cd" },
			},
		},
	},

	renderer = {
		indent_markers = {
			enable = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},
	},

	actions = {
		file_popup = {
			open_win_config = {
				col = 1,
				row = 1,
				relative = "cursor",
				border = "single",
			},
		},
	},

	filters = {
		dotfiles = false,
		custom = { ".git" },
	},
})
