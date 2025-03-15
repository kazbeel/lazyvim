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
set_keymap("v", "p", '"_dP', { desc = "Paste (preserves yanked)" })

-- Navigate buffers
-- Defined in bufferline because it respects focus order after tabs are moved (b< b>)
-- set_keymap("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
-- set_keymap("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })
set_keymap("n", "<leader>bq", "<cmd>q<CR>", { desc = "Quit the current window" })

-- Clear search highlight and save file
set_keymap("n", "<ESC>", "<cmd>w | nohlsearch<CR>", { desc = "Clear highlighs" })

set_keymap("n", "yA", "<cmd>%y+<CR>", { desc = "Copy the whole file content" })
set_keymap("n", "vA", "ggVG", { desc = "Select the whole file content" })

-- Keep cursor in the center
set_keymap("n", "<C-d>", "<C-d>zz")
set_keymap("n", "<C-u>", "<C-u>zz")
set_keymap("n", "n", "nzzzv")
set_keymap("n", "N", "Nzzzv")

-- Search and Replace
set_keymap("n", "c.", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Search and replace word under cursor" })

-- Resize windows (only for macOS)
if vim.fn.has("macunix") == 1 then
  -- Remove LazyVim keymaps
  vim.keymap.del("n", "<C-Up>")
  vim.keymap.del("n", "<C-Down>")
  vim.keymap.del("n", "<C-Left>")
  vim.keymap.del("n", "<C-Right>")

  set_keymap("n", "<leader>wk", "<cmd>resize +10<Cr>", { desc = "Increase Window Height" })
  set_keymap("n", "<leader>wj", "<cmd>resize -10<Cr>", { desc = "Decrease Window Height" })
  set_keymap("n", "<leader>wh", "<cmd>vertical resize -10<Cr>", { desc = "Decrease Window Width" })
  set_keymap("n", "<leader>wl", "<cmd>vertical resize +10<Cr>", { desc = "Increase Window Width" })
end

-- Delete better indenting keymaps
vim.keymap.del("v", "<")
vim.keymap.del("v", ">")

-- Delete Floating terminal keymaps
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del({ "n", "t" }, "<c-/>")
vim.keymap.del({ "n", "t" }, "<c-_>")

if vim.g.vscode then
  local vscode = require("vscode")

  -- In VSCode we work with tabs instead of buffers
  set_keymap("n", "<Tab>", "<cmd>Tabnext<cr>", { desc = "Go to next tab" })
  set_keymap("n", "<S-Tab>", "<cmd>Tabprevious<cr>", { desc = "Go to previous tab" })
  set_keymap("n", "<leader>bd", "<cmd>Tabclose<cr>", { desc = "Delete tab" })

  set_keymap("n", "<leader>bq", function()
    vscode.action("workbench.action.closeEditorsAndGroup")
  end, { desc = "Delete group of tabs" })

  set_keymap("n", "gi", function()
    vscode.action("editor.action.goToImplementation")
  end, { desc = "Delete the current tab" })

  set_keymap("n", "<leader>sc", function()
    vscode.action("search.action.clearSearchResults")
    vscode.action("workbench.action.focusActiveEditorGroup")
  end, { desc = "Clear global search results" })

  set_keymap("n", "]h", function()
    vscode.action("workbench.action.editor.nextChange")
  end, { desc = "Go to next hunk" })
  set_keymap("n", "[h", function()
    vscode.action("workbench.action.editor.previousChange")
  end, { desc = "Go to previous hunk" })

  set_keymap("n", "]x", function()
    vscode.action("workbench.action.compareEditor.nextChange")
  end, { desc = "Go to next difference" })
  set_keymap("n", "[x", function()
    vscode.action("workbench.action.compareEditor.previousChange")
  end, { desc = "Go to previous difference" })

  set_keymap("n", "]d", function()
    vscode.action("editor.action.marker.next")
  end, { desc = "Go to next info diagnosic" })
  set_keymap("n", "[d", function()
    vscode.action("editor.action.marker.prev")
  end, { desc = "Go to previous info diagnosic" })
  set_keymap("n", "]w", function()
    vscode.action("editor.action.marker.next")
  end, { desc = "Go to next warning diagnostic" })
  set_keymap("n", "[w", function()
    vscode.action("editor.action.marker.prev")
  end, { desc = "Go to previous warning diagnostic" })
  set_keymap("n", "]e", function()
    vscode.action("editor.action.marker.next")
  end, { desc = "Go to next error diagnosic" })
  set_keymap("n", "[e", function()
    vscode.action("editor.action.marker.prev")
  end, { desc = "Go to previous error diagnosic" })

  set_keymap("n", "<leader>cr", function()
    vscode.action("editor.action.rename")
  end, { desc = "Rename object" })

  set_keymap("n", "<leader>/", function()
    vscode.action("workbench.action.findInFiles")
  end, { desc = "Find text in files" })
  set_keymap("n", "<leader>ff", function()
    vscode.action("workbench.action.findInFiles")
  end, { desc = "Find text in files" })

  set_keymap("n", "<leader><space>", function()
    vscode.action("workbench.action.quickOpen")
  end, { desc = "Find files" })

  set_keymap("n", "<leader>uw", function()
    vscode.action("editor.action.toggleWordWrap")
  end, { desc = "Toggle word wrap" })

  set_keymap("n", "<leader>gg", function()
    vscode.action("workbench.view.scm")
  end, { desc = "Open SCM" })
end
