local snacks_terminal = require("snacks.terminal")

-- disable snacks terminal's double-esc to normal mode
-- for cancel agent app like opencode, codex
require("snacks").config.styles.terminal.keys.term_normal = nil

local function hide_all_terminals()
  for _, terminal in ipairs(snacks_terminal.list()) do
    if terminal:valid() then
      terminal:hide()
    end
  end
end
local function focus_terminal(count)
  local terminal, created = snacks_terminal.get(nil, { count = count })
  if terminal then
    if created then
      return
    elseif terminal:valid() and vim.api.nvim_get_current_win() == terminal.win then
      terminal:hide()
    else
      hide_all_terminals()
      terminal:show()
    end
  end
end

local function close_current_terminal()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_win = vim.api.nvim_get_current_win()

  for _, terminal in ipairs(snacks_terminal.list()) do
    if terminal:valid() and (terminal.buf == current_buf or terminal.win == current_win) then
      terminal:close()
      return
    end
  end
end

local function paste_from_system_clipboard()
  vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end

-- saki, move.
vim.api.nvim_set_keymap("i", "<A-h>", "<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-l>", "<Right>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<A-L>", "<C-o>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-H>", "<C-o>b", { noremap = true, silent = true })

-- delete
vim.api.nvim_set_keymap("i", "<A-BS>", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-Del>", "<C-o>dw", { noremap = true, silent = true })

-- terminal mode
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true })
vim.keymap.set({ "i", "s" }, "jk", "<Esc>", { desc = "退出模式 (jk)" })

for i = 0, 9 do
  vim.keymap.set({ "n", "i", "t" }, string.format("<A-%d>", i), function()
    focus_terminal(i)
  end, { desc = string.format("Focus terminal %d", i) })
end

vim.keymap.set({ "n", "i", "t" }, "<A-->", hide_all_terminals, { desc = "Hide all terminals" })
vim.keymap.set({ "n" }, "<leader>td", close_current_terminal, { desc = "Close current terminal" })

-- open zsh in new terminal tab
vim.api.nvim_set_keymap("n", "<Leader>tz", ":terminal zsh<CR>", { noremap = true, silent = true })

-- Jump to the first non-blank character of the current line
vim.keymap.set("n", "<A-h>", "^", { desc = "Go to line start" })
vim.keymap.set("n", "<A-l>", "g_", { desc = "Go to line end" })
vim.keymap.set("v", "<A-h>", "^", { desc = "Go to line start (visual mode)" })
vim.keymap.set("v", "<A-l>", "g_", { desc = "Go to line end (visual mode)" })

-- page
vim.api.nvim_set_keymap("n", "<A-j>", "<C-d>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", "<C-u>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<AS-j>", "<C-f>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<AS-k>", "<C-b>", { noremap = true, silent = true })

-- copy current file path
vim.keymap.set("n", "<leader>fy", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.fn.setreg("*", path)
  vim.notify("Copied: " .. path)
end, { desc = "Yank current file full path" })

-- switch window
local function switch_window(dir)
  vim.cmd("wincmd " .. dir)
  vim.api.nvim_input("<C-\\><C-n>")
  vim.fn.system("fcitx5-remote -c")
end

vim.keymap.set({ "n", "i", "t", "v" }, "<C-h>", function()
  switch_window("h")
end, { desc = "Switch to left window" })
vim.keymap.set({ "n", "i", "t", "v" }, "<C-l>", function()
  switch_window("l")
end, { desc = "Switch to right window" })

-- cv engineer
vim.keymap.set({ "i", "t" }, "<C-v>", paste_from_system_clipboard, { desc = "Paste from system clipboard" })
