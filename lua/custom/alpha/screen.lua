math.randomseed(os.time()) -- For random header.

-- Create button for initial keybind.
--- @param sc string
--- @param txt string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 5,
		width = 50,
		align_shortcut = "right",
		hl_shortcut = "Keyword",
	}
	if keybind then
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "normal", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

Headers = require("custom.alpha.headers")
local default_header = {
	type = "text",
	val = Headers[math.random(#Headers)],
	opts = {
		position = "center",
		hl = "Type",
		-- wrap = "overflow";
	},
}

local footer = {
	type = "text",
	-- Change "rdn" to any program that gives you a random quote.
	-- https://github.com/BeyondMagic/scripts/blob/master/quotes/rdn
	-- Which returns one to three lines, being each divided by a line break.
	-- Or just an array: { "I see you:", "Above you." }
	val = "",
	opts = {
		position = "center",
		hl = "Number",
	},
}

local buttons = {
	type = "group",
	val = {

		button("f", "Find file", ":Telescope find_files hidden=true<CR>"),
		button("r", "Recently opened files", ":Telescope oldfiles<CR>"),
		button("p", "Projects", ":Telescope projects<CR>"),
		button("n", "Neorg", ":Neorg index<CR>"),
		button("q", "Quit", ":q<CR>"),
	},
	opts = {
		spacing = 1,
	},
}

local section = {
	header = default_header,
	buttons = buttons,
	footer = footer,
}

--
-- Centering handler of ALPHA
--

local ol = {
	-- occupied lines
	icon = #default_header.val, -- CONST: number of lines that your header will occupy
	message = 1 + #footer.val, -- CONST: because of padding at the bottom
	length_buttons = #buttons.val * 2 - 1, -- CONST: it calculate the number that buttons will occupy
	neovim_lines = 3, -- CONST: 2 of command line, 1 of the top bar
	padding_between = 2, -- STATIC: can be set to anything, padding between keybinds and header
}

local left_terminal_value = vim.api.nvim_get_option("lines")
	- (ol.length_buttons + ol.message + ol.padding_between + ol.icon + ol.neovim_lines)
local top_padding = math.floor(left_terminal_value / 2)
local bottom_padding = left_terminal_value - top_padding

--
-- Set alpha sections
--

local opts = {
	layout = {
		{ type = "padding", val = top_padding },
		section.header,
		{ type = "padding", val = ol.padding_between },
		section.buttons,
		section.footer,
		{ type = "padding", val = bottom_padding },
	},
	opts = {
		margin = 5,
	},
}

return {
	button = button,
	section = section,
	opts = opts,
}
