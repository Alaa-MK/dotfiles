local colors = require("tokyonight.colors").setup()

-- nvim-treesitter-context
vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { fg = "#3c3c53" })
vim.api.nvim_set_hl(0, "TreesitterContext", {})

vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3c3c53" })

vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.green })
