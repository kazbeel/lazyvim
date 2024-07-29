return {
  url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
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
      },
      filetypes = {
        "typescript",
        "javascript",
      },
    })
  end,
}
