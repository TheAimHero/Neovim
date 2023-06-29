local options = {
	backup = false,
	clipboard = "unnamedplus",
	autoread = true,
	cmdheight = 0,
	completeopt = { "menuone", "noselect" },
	conceallevel = 2,
	fileencoding = "utf-8",
	hlsearch = true,
	incsearch = true,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitkeep = vim.fn.has("nvim-0.10.0") == 1 and "screen" or nil,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeout = true,
	timeoutlen = 400,
	undofile = true,
	updatetime = 300,

	signcolumn = "auto",
	writebackup = false,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	nrformats = "alpha",
	cursorline = false,
	number = true,
	relativenumber = true,
	scrolloff = 8,
	sidescrolloff = 8,
	errorbells = false,
	title = true,
	-- pumblend = 20,
	-- winblend = 20,
	winwidth = 10,
	winminwidth = 10,
	breakindent = true,
	linebreak = true,
	wrap = false,
	equalalways = false,
	ruler = false,
	infercase = true,
	virtualedit = "block",
	fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,diff:]],
	foldlevelstart = 99,
	foldmethod = "manual",
	foldnestmax = 10,
	foldcolumn = "1",
	foldlevel = 99,
	foldenable = true,
}
for k, v in pairs(options) do
	vim.opt[k] = v
end

if vim.fn.has("nvim-0.10.0") == 1 then
	vim.opt.diffopt:append("linematch:60")
end

vim.opt.iskeyword:append("-")
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
