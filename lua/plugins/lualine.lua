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

        for _, client in ipairs(vim.lsp.get_active_clients()) do
          if client.attached_buffers[vim.api.nvim_get_current_buf()] and client.name ~= "null-ls" then
            lsp_servers = lsp_servers .. " " .. client.name
          end
        end

        return lsp_servers
      end

      return ""
    end

    opts.options.section_separators = { left = "", right = "" }
    opts.options.component_separators = { left = "│", right = "│" }
    opts.sections.lualine_a = { mode }
    opts.sections.lualine_y = { lsp_status }
    opts.sections.lualine_z = { progress, location }
  end,
}
