return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true, -- 显示所有文件，包括隐藏文件
          hide_dotfiles = false, -- 不隐藏以 . 开头的文件
          hide_gitignored = true, -- 隐藏被 .gitignore 忽略的文件
        },
      },
    })
  end,
}
