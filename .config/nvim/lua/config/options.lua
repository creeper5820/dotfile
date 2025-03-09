-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local option = vim.opt

-- Shell
option.shell = "/usr/bin/zsh"

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

vim.g.neovide_transparency = 0.8
vim.g.transparency = 0.8

vim.g.neovide_cursor_vfx_mode = "railgun"

-- Keep root directory on neo-tree
vim.g.root_spec = { "cwd" }

-- For remote clipboard
option.clipboard = "unnamedplus"
