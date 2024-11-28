local Util = require("lazyvim.util")

return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>fe", false },
    { "<leader>fE", false },
    { "<leader>e", false },
    { "<leader>E", false },
    { "<leader>ge", false },
    { "<leader>be", false },
    {
      "<C-n>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
  },
  opts = {
    window = {
      position = "float",
      popup = {},
      mappings = {
        ["S"] = "split_with_window_picker",
        ["s"] = "vsplit_with_window_picker",
        ["["] = "prev_source",
        ["]"] = "next_source",
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_pattern = {
          ".gitkeep",
          "node_modules",
        },
        never_show_by_pattern = {
          ".git",
          ".svn",
          ".hg",
          "CVS",
          ".DS_Store",
        },
      },
    },
    popup_border_style = "rounded",
    default_component_configs = {
      file_size = { enabled = false },
      type = { enabled = false },
      last_modified = { enabled = false },
      created = { enabled = false },
    },
  },
}
