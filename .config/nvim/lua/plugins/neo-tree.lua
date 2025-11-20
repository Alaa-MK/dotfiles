return {
  "nvim-neo-tree/neo-tree.nvim",

  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },
    default_component_configs = {
      indent = {
        -- markers
        indent_marker = "│",
        last_indent_marker = "╰",

        -- expanders
        expander_collapsed = "",
        expander_expanded = "",
      },
    },
  },
}
