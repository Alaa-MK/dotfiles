return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- gomodifytags is excluded — tag management is already handled by gopls
    opts.sources = vim.tbl_filter(function(source)
      return source.name ~= "gomodifytags"
    end, opts.sources or {})
  end,
}
