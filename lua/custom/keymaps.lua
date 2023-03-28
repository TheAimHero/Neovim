local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Normal Mode

--Cycle between git hunks
keymap("n", "]g", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", opts)
keymap("n", "[g", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", opts)

--Dap keys
keymap("n", "[e", "<cmd>lua require'dap'.step_back()<cr>")
keymap("n", "]e", "<cmd>lua require'dap'.step_into()<cr>")
keymap("n", "]E", "<cmd>lua require'dap'.step_over()<cr>")
keymap("n", "[E", "<cmd>lua require'dap'.step_out()<cr>")
keymap("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })

--Move between windows
keymap("n", "<C-H>", "<C-w>h", { desc = "Focus on left window" })
keymap("n", "<C-J>", "<C-w>j", { desc = "Focus on below window" })
keymap("n", "<C-K>", "<C-w>k", { desc = "Focus on above window" })
keymap("n", "<C-L>", "<C-w>l", { desc = "Focus on right window" })

--Empty line above or below
keymap("n", "gO", "<cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Put empty line above" })
keymap("n", "go", "<cmd>call append(line('.'),     repeat([''], v:count1))<CR>", { desc = "Put empty line below" })

-- Search visually selected text (slightly better than builtins in Neovim>=0.8)
keymap("x", "*", [[y/\V<C-R>=escape(@", '/\')<CR><CR>]])
keymap("x", "#", [[y?\V<C-R>=escape(@", '?\')<CR><CR>]])

-- Redo
keymap("n", "U", "<C-r>", opts)

--Rename
keymap({ "n", "x" }, "<leader>ur", function()
	require("ssr").open()
end, opts)

--Toggle Stuff

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
keymap("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
keymap("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)

-- Insert Mode
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

--Resize
keymap("i", "<C-Up>", ":resize -2<CR>", opts)
keymap("i", "<C-Down>", ":resize +2<CR>", opts)
keymap("i", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("i", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block Mode
--Yanky keymaps
keymap("x", "p", "<Plug>(YankyPutAfter)", opts)
keymap("x", "P", "<Plug>(YankyPutBefore)", opts)
keymap("x", "y", "<Plug>(YankyYank)", opts)


keymap("t", "<C-h>", "<C-\\><C-N><C-h>", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-j>", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-k>", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-l>", opts)
