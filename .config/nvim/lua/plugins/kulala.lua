return {
  "mistweaverco/kulala.nvim",
  opts = {
    ui = {
      winbar = false,
      show_request_summary = false,
    },
    kulala_keymaps = {
      ["Show verbose"] = {
        "D",
        function()
          require("kulala.ui").show_verbose()
        end,
      },
    },
  },
}
