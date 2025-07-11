return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        mason = false,
        cmd = { "/Users/alaa/.asdf/shims/ruby-lsp" },
      },
      rubocop = {
        enabled = false, -- it runs as a part of ruby-lsp
      },
    },
  },
}
