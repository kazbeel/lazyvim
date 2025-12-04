return {
  "stevearc/conform.nvim",
  cond = not vim.g.vscode,
  opts = {
    formatters_by_ft = {
      yaml = { "yamlfmt" },
    },
  },
}
