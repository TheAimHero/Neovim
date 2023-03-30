local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	autoread = true, -- when file changed, autoread it
	cmdheight = 0, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	incsearch = true, -- show search results while typing
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeout = true,
	timeoutlen = 400, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	-- if a file isyes being edited by another program
	-- (or was writtenyes to file while editing with another program), it is not allowed to be edited
	signcolumn = "auto",
	writebackup = false,
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	scrolloff = 8, -- is one of my fav
	sidescrolloff = 8,
	errorbells = false, -- no error bells
	title = true, -- show title in terminal header
	pumblend = 20,
	winblend = 20,
	winwidth = 10,
	winminwidth = 10,
	breakindent = true,
	linebreak = true, -- Wrap long lines at 'breakat' (if 'wrap' is set)
	wrap = false, --Display long lines as just one line
	equalalways = false,
	ruler = false, -- Don't show cursor position in command line
	infercase = true, --Infer letter cases for richer built-in keyword completion
	virtualedit = "block", -- Allow going past the end of line in visual block mode
	fillchars = { diff = "" },
	foldlevelstart = 99,
	foldnestmax = 10,
	foldcolumn = "0",
	foldlevel = 99,
	foldenable = false,
}
for k, v in pairs(options) do
	vim.opt[k] = v
end

if vim.fn.has("nvim-0.9.0") == 1 then
	vim.opt.statuscolumn = [[%!v:lua.Status.column()]]
	vim.opt.diffopt:append("linematch:60") -- enable linematch diff algorithm
end

-- t.shortmess = "aWAICF" -- flags to shorten vim messages, see :help 'shortmess' --Causes some problems
vim.opt.iskeyword:append("-") -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use
