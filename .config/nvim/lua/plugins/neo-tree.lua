return {
  "nvim-neo-tree/neo-tree.nvim",

  enabled = false,
  opts = {
    filesystem = {
      bind_to_cwd = true,
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
