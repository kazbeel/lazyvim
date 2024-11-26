return {
  "akinsho/git-conflict.nvim",
  version = "*",
  config = true,
  lazy = false,
  opts = {
    default_mappings = false,
  },
  keys = {
    { "<leader>gCo", "<cmd>GitConflictChooseOurs<cr>", desc = "Select the current changes" },
    { "<leader>gCt", "<cmd>GitConflictChooseTheirs<cr>", desc = "Select the incoming changes" },
    { "<leader>gCb", "<cmd>GitConflictChooseBoth<cr>", desc = "Select both changes" },
    { "<leader>gC0", "<cmd>GitConflictChooseNone<cr>", desc = "Select none of the changes" },
    { "<leader>gCq", "<cmd>GitConflictListQf<cr>", desc = "Open conflicts in quickfix" },
    { "]x", "<cmd>GitConflictNextConflict<cr>", desc = "Move to the next conflict" },
    { "[x", "<cmd>GitConflictPrevConflict<cr>", desc = "Move to the previous conflict" },
  },
}
