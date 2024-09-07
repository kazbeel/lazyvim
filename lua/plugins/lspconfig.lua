return {
  "neovim/nvim-lspconfig",
  optional = true,
  init = function()
    -- Show diagnostics when cursor is on the line
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float({
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        })
      end,
    })
  end,
  opts = function(_, opts)
    ---
    -- Keymaps
    ---
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- Replace hover
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gh", vim.lsp.buf.hover, desc = "Hover" }

    -- Add F12 to find all references (same as in VSCode)
    keys[#keys + 1] = {
      "<F12>",
      "<cmd>Trouble lsp_references<CR>",
      desc = "References",
    }

    ---
    -- Configuration
    ---
    opts.diagnostics = {
      virtual_text = false,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
      },
    }
    opts.inlay_hints = {
      enabled = false,
    }
    opts.servers = {
      yamlls = {
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            customTags = {
              -- Gitlab CI
              "!reference sequence",
              -- Home Assistant
              "!secret",
              "!include_dir_merge_list",
              "!include_dir_merge_named",
            },
            schemas = {
              kubernetes = { "k8s**.{yml,yaml}", "kube*/*.{yml,yaml}" },
            },
          },
        },
      },
      ts_ls = {
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
    }
  end,
}
