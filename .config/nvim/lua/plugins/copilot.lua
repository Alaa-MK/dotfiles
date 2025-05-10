return {
  "zbirenbaum/copilot.lua",
  -- opts will be merged with the parent spec
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = "<C-Space>",
      },
    },
    copilot_node_command = "/opt/homebrew/bin/node",
  },
}
