local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require("telescope.actions")

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      prompt_prefix = " ",
      selection_caret = "❯ ",
      file_ignore_patterns = {
        ".git/",
        "__snapshots__",
      },
      path_display = { "truncate" },
      mappings = {
        i = {
          ["<ESC>"] = actions.close,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<Down>"] = actions.cycle_history_next,
          ["<Up>"] = actions.cycle_history_prev,
          ["<C-->"] = require("telescope.actions.layout").toggle_preview,
          ["<C-q>"] = require("trouble.sources.telescope").open,
        },
      },
      layout_config = {
        width = 0.90,
        height = 0.90,
      },
    })

    opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
      live_grep = {
        -- Avoid results when matching on filepaths
        only_sort_text = true,
        file_ignore_patterns = {
          ".git/",
          "__snapshots__",
          "package%-lock.json",
          "CHANGELOG.md",
        },
        additional_args = function()
          return { "--hidden" }
        end,
      },
      find_files = {
        hidden = true,
      },
    })
  end,
  keys = {
    {
      "<C-p>",
      "<cmd>Telescope find_files hidden=true<CR>",
      desc = "Find files",
    },
    {
      "<leader>gC",
      "<cmd>Telescope git_bcommits<CR>",
      desc = "Find git commits of buffer",
    },
  },
}
