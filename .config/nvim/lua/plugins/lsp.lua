local GOPLS_EXCLUDED = {
  ["gopls.assembly"] = true, -- Browse amd64 assembly
  ["gopls.gc_details"] = true, -- Show compiler optimization details
  ["gopls.client_open_url"] = true, -- Browse gopls feature documentation
  -- ["gopls.doc"] = true, -- Browse documentation (type/package/func)
  ["gopls.split_package"] = true, -- Split package playground (browser UI)
}

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
      -- Must live in ["*"] rather than ["gopls"]: Snacks puts each unique lsp
      -- filter in its own bucket with its own LspAttach callback. Both the "*"
      -- and "gopls" buckets fire when gopls attaches, and last-one-wins is
      -- decided by pairs() iteration order — a race. Overriding inside the
      -- same "*" bucket avoids it entirely.
      ["*"] = {
        keys = {
          {
            "<leader>ca",
            function()
              vim.lsp.buf.code_action({
                filter = function(action)
                  local id = (action.command and action.command.command) or action.kind
                  return not GOPLS_EXCLUDED[id]
                end,
              })
            end,
            desc = "Code Action",
            has = "codeAction",
            mode = { "n", "x" },
          },
        },
      },
    },
  },
}
