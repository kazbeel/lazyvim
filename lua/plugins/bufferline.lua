return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      right_mouse_command = false,
      middle_mouse_command = function(n)
        require("mini.bufremove").delete(n, false)
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
  },
}
