return {
  "akinsho/bufferline.nvim",
  -- This is a temporaty fix until LazyVim integrates the breaking changes from catppuccin
  -- @See https://github.com/LazyVim/LazyVim/pull/6354
  -- @See https://github.com/LazyVim/LazyVim/issues/6355
  init = function()
    local bufline = require("catppuccin.groups.integrations.bufferline")
    function bufline.get()
      return bufline.get_theme()
    end
  end,
  opts = {
    options = {
      right_mouse_command = false,
      middle_mouse_command = function(n)
        LazyVim.ui.bufremove(n)
      end,
      show_buffer_close_icons = false,
      show_close_icon = false,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer",
          highlight = "Directory",
          text_align = "center",
        },
      },
    },
  },
  keys = {
    { "<leader>b<", "<cmd>BufferLineMovePrev<CR>", desc = "Move current buffer to the left in the buffer line" },
    { "<leader>b>", "<cmd>BufferLineMoveNext<CR>", desc = "Move current buffer to the right in the buffer line" },
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Go to next buffer" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Go to previous buffer" },
  },
}
