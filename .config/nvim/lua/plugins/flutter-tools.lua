return {
  "nvim-flutter/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  keys = {
    -- Flutter 运行/控制
    { "<leader>fr", "<Cmd>FlutterRun<CR>", { desc = "Flutter Run" } },
    { "<leader>fR", "<Cmd>FlutterRestart<CR>", { desc = "Flutter Hot Restart" } },
    { "<leader>fh", "<Cmd>FlutterReload<CR>", { desc = "Flutter Hot Reload" } },
    { "<leader>fq", "<Cmd>FlutterQuit<CR>", { desc = "Flutter Quit Session" } },
  },
  config = function()
    require("flutter-tools").setup({
      flutter_path = "/home/creeper/app/flutter/sdk/bin/flutter",
    })
  end,
}
