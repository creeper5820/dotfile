local kEverforest = {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_enable_italic = false
    vim.g.everforest_background = "hard"
    vim.o.background = "light"
    vim.cmd.colorscheme("everforest")
  end,
}
_ = kEverforest

local kRosePine = {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    vim.cmd("colorscheme rose-pine")
  end,
}
_ = kRosePine

local kTokoyNight = {
  "folke/tokyonight.nvim",
  opts = {
    style = "day",
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      functions = {},
      variables = {},
    },
  },
}
_ = kTokoyNight

return kTokoyNight
