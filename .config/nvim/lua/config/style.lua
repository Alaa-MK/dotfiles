local colors = require("tokyonight.colors").setup()
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.green })

-- CursorLine transparent green
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1c1d28" })

-- Disable anmiations
vim.g.snacks_animate = false

-- indentation guides
vim.opt.listchars = "tab:│——,lead:‧,leadmultispace:│‧‧‧,extends:»,precedes:«"
