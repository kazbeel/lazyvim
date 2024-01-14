return {
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  event = "VeryLazy",
  config = function(_, opts)
    require("window-picker").setup(opts)
  end,
  opts = {
    selection_chars = "HJKLYUIONMGFDSATREWQBVCXZ",
    show_prompt = false,
    highlights = {
      statusline = {
        focused = {
          fg = "#000000",
          bg = "#c7d7e0",
          bold = true,
        },
        unfocused = {
          fg = "#000000",
          bg = "#5d57a3",
          bold = false,
        },
      },
    },
  },
}
