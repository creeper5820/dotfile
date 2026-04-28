return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      trash = false,
    },
    scroll = { enabled = true },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
    terminal = {
      win = {
        position = "float",
        border = "rounded",
      },
    },
  },
}
