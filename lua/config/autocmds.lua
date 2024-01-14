-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Disable autocomment new lines
local disable_autocomment = vim.api.nvim_create_augroup("DisableAutocomment", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = disable_autocomment,
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Set relative number only in focused window and when in normal mode
-- Translated autocommands of "numbertoggle"
-- https://github.com/jeffkreeftmeijer/vim-numbertoggle
local toggle_relative_number_group = vim.api.nvim_create_augroup("ToggleRelativeNumbers", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  group = toggle_relative_number_group,
  pattern = "*",
  callback = function()
    if vim.o.number and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
  group = toggle_relative_number_group,
  pattern = "*",
  callback = function()
    if vim.o.number then
      vim.opt.relativenumber = false
      vim.cmd("redraw")
    end
  end,
})
