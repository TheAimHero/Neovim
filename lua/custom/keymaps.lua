local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

keymap("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })

--Empty line above or below
keymap("n", "gO", "<cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Put empty line above" })
keymap("n", "go", "<cmd>call append(line('.'),     repeat([''], v:count1))<CR>", { desc = "Put empty line below" })

-- Redo
keymap("n", "U", "<C-r>", opts)

keymap("n", "<C-H>", "<C-w>h", { desc = "Focus on left window" })
keymap("n", "<C-J>", "<C-w>j", { desc = "Focus on below window" })
keymap("n", "<C-K>", "<C-w>k", { desc = "Focus on above window" })
keymap("n", "<C-L>", "<C-w>l", { desc = "Focus on right window" })

--Yanky keymaps
keymap("n", "p", "<Plug>(YankyPutAfter)", opts)
keymap("n", "P", "<Plug>(YankyPutBefore)", opts)
keymap("n", "]r", "<Plug>(YankyCycleForward)", opts)
keymap("n", "[r", "<Plug>(YankyCycleBackward)", opts)
keymap("n", "y", "<Plug>(YankyYank)", opts)

--Goto-Preview keymaps

-- Insert Mode
keymap("i", "jk", "<ESC>", opts)

-- Visual Block Mode
--Yanky keymaps
keymap("x", "p", "<Plug>(YankyPutAfter)", opts)
keymap("x", "P", "<Plug>(YankyPutBefore)", opts)
keymap("x", "y", "<Plug>(YankyYank)", opts)

-- keymap("t", "<C-h>", "<C-\\><C-N><C-h>", opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-j>", opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-k>", opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-l>", opts)
