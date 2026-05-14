-- Disable LazyVim's auto spell check for markdown/text (prevents Chinese spell check)
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
