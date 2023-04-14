local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap("", "<C-a>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Cycle between git hunks

keymap("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })

--Empty line above or below
keymap("n", "gO", "<cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Put empty line above" })
keymap("n", "go", "<cmd>call append(line('.'),     repeat([''], v:count1))<CR>", { desc = "Put empty line below" })

-- Redo
keymap("n", "U", "<C-r>", opts)

--Resize
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--Yanky keymaps
keymap("n", "p", "<Plug>(YankyPutAfter)", opts)
keymap("n", "P", "<Plug>(YankyPutBefore)", opts)
keymap("n", "<c-n>", "<Plug>(YankyCycleForward)", opts)
keymap("n", "<c-p>", "<Plug>(YankyCycleBackward)", opts)
keymap("n", "y", "<Plug>(YankyYank)", opts)
keymap("n", "np", "<cmd>nohlsearch<CR><Plug>(YankyPutIndentAfterLinewise)", opts)
keymap("n", "Np", "<cmd>nohlsearch<CR><Plug>(YankyPutIndentBeforeLinewise)", opts)

--Goto-Preview keymaps

-- Insert Mode
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

--Resize
keymap("i", "<C-Up>", ":resize -2<CR>", opts)
keymap("i", "<C-Down>", ":resize +2<CR>", opts)
keymap("i", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("i", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Visual Block Mode
--Yanky keymaps
keymap("x", "p", "<Plug>(YankyPutAfter)", opts)
keymap("x", "P", "<Plug>(YankyPutBefore)", opts)
keymap("x", "y", "<Plug>(YankyYank)", opts)

keymap("t", "<C-h>", "<C-\\><C-N><C-h>", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-j>", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-k>", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-l>", opts)
