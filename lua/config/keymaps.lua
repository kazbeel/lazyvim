-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local set_keymap = vim.keymap.set

set_keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })

set_keymap("n", "ZA", "<cmd>qa<CR>", { desc = "Exit vim unless there are unsaved buffers" })

-- Faster cursor motion
set_keymap("n", "H", "g^")
set_keymap("n", "J", "5j")
set_keymap("n", "K", "5k")
set_keymap("n", "L", "g$")

set_keymap("v", "H", "g^")
set_keymap("v", "J", "5j")
set_keymap("v", "K", "5k")
set_keymap("v", "L", "g$")

set_keymap("n", "<leader>J", "J", { desc = "Join [count] lines" })

set_keymap("n", "<leader>O", "O<Esc>", { desc = "Add [count] empty line above" })
set_keymap("n", "<leader>o", "o<Esc>", { desc = "Add [count] empty line below" })

set_keymap("n", "Y", "yg_", { desc = "Yank to the end of the line" })
set_keymap("n", "U", "<C-r>", { desc = "Redo" })

-- Navigate buffers
set_keymap("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
set_keymap("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })
set_keymap("n", "<leader>bq", "<cmd>q<CR>", { desc = "Quit the current window" })

-- Clear search highlight
set_keymap("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Clear highlighs" })

set_keymap("n", "yA", "<cmd>%y+<CR>", { desc = "Copy the whole file content" })
set_keymap("n", "vA", "ggVG", { desc = "Select the whole file content" })

-- Keep cursor in the center
set_keymap("n", "<C-d>", "<C-d>zz")
set_keymap("n", "<C-u>", "<C-u>zz")
set_keymap("n", "n", "nzzzv")
set_keymap("n", "N", "Nzzzv")

-- Search and Replace
set_keymap("n", "c.", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Search and replace word under cursor" })

-- Delete better indenting keymaps
vim.keymap.del("v", "<")
vim.keymap.del("v", ">")

-- Delete Floating terminal keymaps
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del({ "n", "t" }, "<c-/>")
vim.keymap.del({ "n", "t" }, "<c-_>")
