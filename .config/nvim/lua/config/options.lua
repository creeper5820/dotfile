-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local option = vim.opt

-- Shell
option.shell = "fish"

-- For Text Edit
option.wrap = true
option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.linespace = 2

-- For Neovide Ui
vim.g.neovide_padding_top = 10
vim.g.neovide_padding_left = 5
vim.g.neovide_padding_right = 5
vim.g.neovide_padding_bottom = 10

vim.g.neovide_opacity = 0.95
vim.g.neovide_normal_opacity = 0.97

vim.g.neovide_cursor_vfx_mode = "railgun"

-- Keep root directory on neo-tree
vim.g.root_spec = { "cwd" }

-- For remote clipboard
option.clipboard = "unnamedplus"

-- 退出插入模式将输入法设置为英文
local ImeAutoGroup = vim.api.nvim_create_augroup("ImeAutoGroup", { clear = true })
vim.api.nvim_create_autocmd("InsertLeave", {
  group = ImeAutoGroup,
  callback = function()
    vim.fn.system("fcitx5-remote -c")
  end,
})
