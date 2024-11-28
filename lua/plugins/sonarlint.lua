return {
  enabled = false,
  url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  dependencies = {
    "nvim-lspconfig",
  },
  ft = { "typescript", "javascript" },
  config = function()
    require("sonarlint").setup({
      server = {
        cmd = {
          "sonarlint-language-server",
          "-stdio",
          "-analyzers",
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
        },
        flags = {
          -- Send text changes to the LSP after a delay
          -- See https://gitlab.com/schrieveslaach/sonarlint.nvim/-/issues/23
          debounce_text_changes = 15 * 1000,
        },
      },
      filetypes = {
        "typescript",
        "javascript",
      },
    })
  end,
}
