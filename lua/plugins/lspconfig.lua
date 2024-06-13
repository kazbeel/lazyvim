return {
  "neovim/nvim-lspconfig",
  optional = true,
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- Replace hover
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gh", vim.lsp.buf.hover, desc = "Hover" }

    -- Replace LSP references ("gr" conflicts with "vim-scripts/ReplaceWithRegister")
    keys[#keys + 1] = { "gr", false }
    keys[#keys + 1] = {
      "<F12>",
      "<cmd>Trouble lsp toggle<cr>",
      desc = "References",
    }

    -- Show diagnostics when cursor is on the line
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float({
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        })
      end,
    })
  end,
  opts = {
    diagnostics = {
      virtual_text = false,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
      },
    },
    inlay_hints = {
      enabled = false,
    },
    servers = {
      yamlls = {
        settings = {
          yaml = {
            customTags = {
              -- Gitlab CI
              "!reference sequence",
              -- Home Assistant
              "!secret",
              "!include_dir_merge_list",
              "!include_dir_merge_named",
            },
          },
        },
      },
      tsserver = {
        preferences = {
          importModuleSpecifierPreference = "project-relative",
        },
      },
      vtsls = {
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = "project-relative",
            },
          },
        },
      },
    },
  },
}
