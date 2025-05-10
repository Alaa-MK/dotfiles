-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- map jk to <esc>
map("i", "jk", "<esc>")
map("i", "JK", "<esc>")

-- tmux navigation
map("n", "<c-h>", "<cmd>:TmuxNavigateLeft<cr>")
map("n", "<c-j>", "<cmd>:TmuxNavigateDown<cr>")
map("n", "<c-k>", "<cmd>:TmuxNavigateUp<cr>")
map("n", "<c-l>", "<cmd>:TmuxNavigateRight<cr>")
map("n", "<c-\\>", "<cmd>:TmuxNavigatePrevious<cr>")

-- toggle indenation guides
map("n", "<leader>u<tab>", "<cmd>set list!<cr>", { desc = "Toggle Indentation Chars" })

-- Formatting
map("n", "<leader>cj", ":%!jq<CR>:setfiletype json<CR>", { noremap = true, silent = true, desc = "Format JSON" })
