return {
  "hiphish/rainbow-delimiters.nvim",
  event = "BufEnter",
  config = function()
    require("rainbow-delimiters.setup").setup({
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
        javascript = "rainbow-delimiters-react",
        typescript = "rainbow-parens",
        tsx = "rainbow-parens",
      },
      highlight = {
        "RainbowDelimiterViolet",
        "RainbowDelimiterOrange",
        "RainbowDelimiterBlue",
        "RainbowDelimiterCyan",
        "RainbowDelimiterYellow",
        "RainbowDelimiterGreen",
        "RainbowDelimiterRed",
      },
      blacklist = { "c", "cpp" },
    })
  end,
}
