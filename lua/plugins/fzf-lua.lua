return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    local fzf = require("fzf-lua")
    local actions = fzf.actions
    local config = fzf.config

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

    local fd_exclusions = {
      ".vscode",
      ".idea",
      "node_modules",
      "dist",
      "coverage",
      ".husky",
      "__snapshots__",
      ".scannerwork",
      ".webpack",
      ".data",
      ".git",
      "package-lock.json",
      ".venv",
      "venv",
      "__pycache__",
    }

    local fd_opts = "--color=never -t f -H -I -L"

    for _, exclusion in ipairs(fd_exclusions) do
      fd_opts = fd_opts .. " -E " .. exclusion
    end

    opts.files = vim.tbl_deep_extend("force", opts.files, {
      -- fd_opts = [[--color=never -t f -H -I -L -E .git -E .idea -E .vscode -E node_modules -E dist -E coverage -E .husky -E __snapshots__ -E .scannerwork -E .webpack -E .data]],
      fd_opts = fd_opts,
      fzf_opts = {
        ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-history-files",
      },
      actions = {
        ["ctrl-r"] = { actions.toggle_ignore },
        ["ctrl-h"] = { actions.toggle_hidden },
      },
    })

    opts.grep = {
      actions = {
        ["ctrl-r"] = { actions.toggle_ignore },
        ["ctrl-h"] = { actions.toggle_hidden },
      },
      fzf_opts = {
        ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-history-grep",
      },
    }

    -- Keymaps within FzfLua

    config.defaults.keymap.builtin["<C-->"] = "toggle-preview"
    config.defaults.keymap.fzf["down"] = "next-history"
    config.defaults.keymap.fzf["up"] = "prev-history"

    -- Move selected files to Trouble instead of Quickfix
    if LazyVim.has("trouble.nvim") then
      config.defaults.actions.files["ctrl-q"] = require("trouble.sources.fzf").actions.open
    end
  end,
  keys = {
    { "<C-p>", LazyVim.pick("files"), desc = "Find files (Root Dir)" },
  },
}
