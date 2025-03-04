-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- For line number color
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#39c5bb" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#bbbbbb", bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#bbbbbb", bold = true })

-- For comment color
vim.api.nvim_set_hl(0, "Comment", { fg = "#66aa99" })
