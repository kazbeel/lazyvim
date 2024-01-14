return {
  "akinsho/git-conflict.nvim",
  version = "*",
  lazy = false,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("git-conflict").setup({
      default_mappings = {
        ours = "co",
        theirs = "ct",
        none = "c0",
        both = "cb",
        next = "]x",
        prev = "[x",
      },
    })
  end,
}
