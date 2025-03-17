return {
  "gbprod/substitute.nvim",
  vscode = true,
  opts = {
    -- The opts is necessary even empty
  },
  keys = {
    {
      "<leader>r",
      function()
        require("substitute").operator()
      end,
      desc = "Replace {motion} text with register content",
    },
    {
      "<leader>rr",
      function()
        require("substitute").line()
      end,
      desc = "Replace [count] lines with register content",
    },
    {
      "<leader>R",
      function()
        require("substitute").eol()
      end,
      desc = "Replace to the end of the line with register content",
    },
    {
      "<leader>r",
      mode = { "v" },
      function()
        require("substitute").visual()
      end,
      desc = "Replace the selection with the register content",
    },
  },
}
