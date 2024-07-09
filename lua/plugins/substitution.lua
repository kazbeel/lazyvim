return {
  "gbprod/substitute.nvim",
  opts = {},
  keys = {
    {
      "<leader>r",
      function()
        require("substitute").operator({ register = "*" })
      end,
      desc = "Replace {motion} text with register content",
    },
    {
      "<leader>rr",
      function()
        require("substitute").line({ register = "*" })
      end,
      desc = "Replace [count] lines with register content",
    },
    {
      "<leader>R",
      function()
        require("substitute").eol({ register = "*" })
      end,
      desc = "Replace to the end of the line with register content",
    },
    {
      "<leader>r",
      mode = { "v" },
      function()
        require("substitute").visual({ register = "*" })
      end,
      desc = "Replace the selection with the register content",
    },
  },
}
