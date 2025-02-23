-- move
vim.api.nvim_set_keymap("i", "<A-h>", "<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-l>", "<Right>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<A-L>", "<C-o>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-H>", "<C-o>b", { noremap = true, silent = true })

-- page
vim.api.nvim_set_keymap("n", "<A-d>", "<C-d>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-u>", "<C-u>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-s>", "<C-e>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-w>", "<C-y>", { noremap = true, silent = true })

-- delete
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-Del>", "<C-o>dw", { noremap = true, silent = true })

-- exit terminal mode
vim.api.nvim_set_keymap("t", "<C-[>", "<C-\\><C-n>", { noremap = true })
-- open zsh in new terminal tab
vim.api.nvim_set_keymap("n", "<Leader>tz", ":vnew | terminal zsh<CR>", { noremap = true, silent = true })
