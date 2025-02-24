return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    local actions = require("fzf-lua").actions

    opts.fzf_opts = {
      ["--cycle"] = true,
    }

    opts.winopts = {
      height = 0.90,
      width = 0.90,
      preview = {
        horizontal = "right:45%",
      },
    }
    opts.files = {
      fd_opts = [[--color=never -t f -H -I -L -E .git -E .idea -E .vscode -E node_modules -E dist -E coverage -E .husky -E __snapshots__ -E .scannerwork -E .webpack -E .data]],
      cwd_header = false,
      cwd_prompt = false,
      actions = false,
    }
    opts.git = {
      cwd_header = false,
    }
    opts.grep = {
      no_header = true,
      actions = {
        ["ctrl-r"] = { actions.toggle_ignore },
      },
    }
    opts.tags = {
      no_header = true,
    }
  end,
  keys = {
    { "<C-p>", require("fzf-lua").files, desc = "Find files" },
  },
}
