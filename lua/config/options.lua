-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.opt.undodir = "/tmp"

-- Disable the current document symbols location from Trouble in lualine
vim.g.trouble_lualine = false

-- Disable Snacks animations
vim.g.snacks_animate = false

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"

-- Avoid conflicts between Prettier and Biome
vim.g.lazyvim_prettier_needs_config = true

vim.g.lazyvim_picker = "fzf"
