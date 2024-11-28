return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local mode = {
      "mode",
      icon = "",
    }

    local progress = {
      "progress",
      separator = "",
      padding = { left = 1, right = 0 },
    }

    local location = {
      "location",
      padding = { left = 1, right = 1 },
    }

    local function lsp_status()
      if rawget(vim, "lsp") then
        local lsp_servers = ""

        for _, client in ipairs(vim.lsp.get_clients()) do
          if client.attached_buffers[vim.api.nvim_get_current_buf()] and client.name ~= "null-ls" then
            lsp_servers = lsp_servers .. " " .. client.name
          end
        end

        return lsp_servers
      end

      return ""
    end

    local icons = LazyVim.config.icons

    opts.options.section_separators = { left = "", right = "" }
    opts.options.component_separators = { left = "│", right = "│" }
    opts.sections.lualine_a = { mode }
    opts.sections.lualine_c = {
      -- Everything is copied from LazyVim expect for the path of the file
      LazyVim.lualine.root_dir(),
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      -- I prefer the full relative path
      { "filename", path = 1 },
    }
    opts.sections.lualine_y = { lsp_status }
    opts.sections.lualine_z = { progress, location }
  end,
}
