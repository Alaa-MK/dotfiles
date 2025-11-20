return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      lazy = false,
      priority = 1000,
      transparent = false,
      styles = {
        -- sidebars = "transparent",
        -- floats = "transparent",
      },
      dim_inactive = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
