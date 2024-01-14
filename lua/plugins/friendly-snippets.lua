return {
  "rafamadriz/friendly-snippets",
  config = function()
    -- for friendly snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    -- for custom snippets
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
  end,
}
