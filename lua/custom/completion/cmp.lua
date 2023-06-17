return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-buffer",
		"FelipeLema/cmp-async-path",
		"petertriho/cmp-git",
	},
	config = function()
		local cmp = require("cmp")

		local kind_icons = {
			Text = "  ",
			Method = "  ",
			Function = "ƒ ",
			Constructor = "  ",
			Field = "  ",
			Variable = "  ",
			Class = "  ",
			Interface = "  ",
			Module = "  ",
			Property = "  ",
			Unit = "  ",
			Value = "  ",
			Enum = "  ",
			Keyword = "  ",
			Snippet = "  ",
			Color = "  ",
			File = "  ",
			Reference = "  ",
			Folder = "  ",
			EnumMember = "  ",
			Constant = "  ",
			Struct = "  ",
			Event = "  ",
			Operator = "  ",
			TypeParameter = "  ",
		}

		cmp.setup({
			enabled = function()
				-- disable completion in comments
				local context = require("cmp.config.context")
				local buftype = vim.bo.buftype
				-- keep command mode completion enabled when cursor is in a comment
				if vim.api.nvim_get_mode().mode == "c" then
					return true
				elseif buftype == "prompt" then --Disable in prompt type buffers
					return false
				else
					return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
				end
			end,

			mapping = {
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["\\y"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
				["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
				-- Accept currently selected item. If none selected, `select` first item.
				-- Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			},

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					-- Kind icons
					vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
					vim_item.abbr = string.sub(vim_item.abbr, 1, 70)
					return vim_item
				end,
			},

			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "async_path" },
			},
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				-- select = false,
				select = true,
			},

			window = {
				completion = cmp.config.window.bordered({ border = "single" }),
				documentation = cmp.config.window.bordered({ border = "single" }),
			},
		})
	end,
}
