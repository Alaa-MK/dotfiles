return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    dashboard = {
      preset = {
        header = require("config.constants.header"),
      },
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
        files = {
          hidden = true,
          ignored = true,
        },
        buffers = {
          hidden = true,
          ignored = true,
        },
        grep = {
          hidden = true,
          ignored = true,
        },
      },
      formatters = {
        file = {
          filename_first = true,
        },
      },
      win = {
        input = {
          keys = {
            -- ["<Esc>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
    },
    lazygit = {
      config = {
        gui = {
          scrollHeight = 20,
          spinner = {
            frames = { "", "", "", "", "", "" },
          },
        },
        git = {
          paging = {
            colorArg = "always",
            pager = "delta --color-only --paging=never --syntax-theme=tokyonight_night --features colibri-tokyonight-night",
          },
          commitPrefix = { pattern = ".*", replace = "$0: " },
        },
        keybinding = {
          commits = {
            moveUpCommit = "",
            moveDownCommit = "",
          },
          universal = {
            copyToClipboard = "y",
            -- ["quit-alt1"] = "<esc>",
          },
        },
      },
    },
  },
  keys = {

    -- Git
    { "<leader>gb", "<cmd>lua Snacks.picker.git_branches()<cr>", desc = "Git Branches" },
    { "<leader>gB", "<cmd>lua Snacks.picker.git_log_line()<cr>", desc = "Git Blame Line" },
    { "<leader>gO", "<cmd>lua Snacks.gitbrowse()<cr>", desc = "Git Browse (open)" },
    { "<leader>gl", "<cmd>lua Snacks.lazygit.log()<cr>", desc = "Git Log" },
    { "<leader>gf", "<cmd>lua Snacks.lazygit.log_file()<cr>", desc = "Git Current File History" },

    -- Unset keymaps
    { "<leader>r", false },
  },
}
