return {
  "akinsho/git-conflict.nvim",
  version = "*",
  config = true,
  lazy = false,
  opts = {
    default_mappings = false,
  },
  keys = {
    { "<leader>gx", desc = "+Resolve git conflics" },
    { "<leader>gxo", "<cmd>GitConflictChooseOurs<cr>", desc = "Select the current changes" },
    { "<leader>gxc", "<cmd>GitConflictChooseOurs<cr>", desc = "Select the current changes" },
    { "<leader>gxt", "<cmd>GitConflictChooseTheirs<cr>", desc = "Select the incoming changes" },
    { "<leader>gxi", "<cmd>GitConflictChooseTheirs<cr>", desc = "Select the incoming changes" },
    { "<leader>gxb", "<cmd>GitConflictChooseBoth<cr>", desc = "Select both changes" },
    { "<leader>gx0", "<cmd>GitConflictChooseNone<cr>", desc = "Select none of the changes" },
    { "<leader>gxq", "<cmd>GitConflictListQf<cr>", desc = "Open conflicts in quickfix" },
    { "]x", "<cmd>GitConflictNextConflict<cr>", desc = "Move to the next conflict" },
    { "[x", "<cmd>GitConflictPrevConflict<cr>", desc = "Move to the previous conflict" },
  },
}
