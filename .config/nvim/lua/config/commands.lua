-- Print all code actions with their stable identifiers (for filtering reference)
vim.api.nvim_create_user_command("CodeActionIds", function()
  vim.lsp.buf_request(0, "textDocument/codeAction", vim.lsp.util.make_range_params(nil, "utf-16"), function(_, result)
    for _, a in ipairs(result or {}) do
      print((a.command and a.command.command or a.kind or "?"), " | ", a.title)
    end
  end)
end, { desc = "List code action identifiers for current position" })
