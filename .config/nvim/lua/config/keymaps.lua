vim.api.nvim_set_keymap("i", "<A-h>", "<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-l>", "<Right>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<A-L>", "<C-o>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-H>", "<C-o>b", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<A-d>", "<C-d>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-u>", "<C-u>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-Del>", "<C-o>dw", { noremap = true, silent = true })
