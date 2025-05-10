return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        selection = {
          -- Don't apply the auto-complete on <enter>
          preselect = false,
          -- auto_insert = false,
        },
      },

      -- Disable ghost text to avoid shifting the code with multi-line suggestions.
      ghost_text = {
        enabled = false,
      },
      menu = {
        draw = {
          components = {
            kind = {
              ellipsis = true,
            },
          },
        },
      },
    },
  },
}
