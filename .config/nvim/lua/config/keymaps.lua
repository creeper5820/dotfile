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
vim.keymap.set("i", "jk", "<Esc>", { desc = "退出插入模式 (jk)" })

-- open zsh in new terminal tab
vim.api.nvim_set_keymap("n", "<Leader>tf", ":terminal fish<CR>", { noremap = true, silent = true })

-- select all
vim.keymap.set({ "n", "v" }, "<C-a>", "<Esc>ggVG", { desc = "Select All" })

-- undo and redo
vim.keymap.set({ "n", "i", "v", "c" }, "<C-z>", "<Undo>", { desc = "Undo" })
vim.keymap.set({ "n", "i", "v", "c" }, "<C-y>", "<C-r>", { desc = "Redo" })

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
