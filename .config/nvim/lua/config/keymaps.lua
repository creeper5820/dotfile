-- saki, move.
vim.api.nvim_set_keymap("i", "<A-h>", "<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-l>", "<Right>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<A-L>", "<C-o>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-H>", "<C-o>b", { noremap = true, silent = true })

-- page
vim.api.nvim_set_keymap("n", "<C-j>", "<C-d>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-u>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<CS-j>", "<C-f>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<CS-k>", "<C-b>", { noremap = true, silent = true })

-- delete
vim.api.nvim_set_keymap("i", "<A-BS>", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-Del>", "<C-o>dw", { noremap = true, silent = true })

-- terminal mode
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("i", "jk", "<Esc>", { desc = "退出插入模式 (jk)" })

vim.api.nvim_set_keymap("t", "<A-j>", "<C-\\><C-n><C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-k>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true })

-- open zsh in new terminal tab
vim.api.nvim_set_keymap("n", "<Leader>tz", ":terminal zsh<CR>", { noremap = true, silent = true })

-- select all
vim.keymap.set({ "n", "v" }, "<C-a>", "<Esc>ggVG", { desc = "Select All" })

-- undo and redo
vim.keymap.set({ "n", "i", "v", "c" }, "<C-z>", "<Undo>", { desc = "Undo" })
vim.keymap.set({ "n", "i", "v", "c" }, "<C-y>", "<C-r>", { desc = "Redo" })

-- Jump to the first non-blank character of the current line
vim.keymap.set("n", "<C-h>", "^", { desc = "Go to line start" })
-- Jump to the last non-blank character of the current line
vim.keymap.set("n", "<C-l>", "g_", { desc = "Go to line end" })
-- Visual mode: jump to line start
vim.keymap.set("v", "<C-h>", "^", { desc = "Go to line start (visual mode)" })
-- Visual mode: jump to line end
vim.keymap.set("v", "<C-l>", "g_", { desc = "Go to line end (visual mode)" })

-- Alt + h/l: switch window left/right
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Move to upper window" })
