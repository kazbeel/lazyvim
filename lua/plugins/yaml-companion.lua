return {
  "msvechla/yaml-companion.nvim",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  ft = { "yaml" },
  opts = {
    builtin_matchers = {
      kubernetes = { enabled = true },
    },
    -- lspconfig = {
    --   settings = {
    --     yaml = {
    --       schemas = {
    --         kubernetes = { "k8s**.yaml", "kube*/*.yaml" },
    --       },
    --     },
    --   },
    -- },
  },
  config = function(_, opts)
    local cfg = require("yaml-companion").setup(opts)

    -- require("lspconfig")["yamlls"].setup(cfg)
    require("telescope").load_extension("yaml_schema")

    -- get schema for current buffer
    local function get_schema()
      local schema = require("yaml-companion").get_buf_schema(0)
      if schema.result[1].name == "none" then
        return ""
      end
      return schema.result[1].name
    end

    require("lualine").setup({
      sections = {
        lualine_x = { get_schema },
      },
    })
  end,
}
