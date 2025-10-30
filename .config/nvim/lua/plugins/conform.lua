return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      php = { "php_cs_fixer" },
    },
    formatters = {
      php_cs_fixer = {
        command = "php-cs-fixer",
        -- args = { "fix", "--using-cache=no", "--quiet", "-" },
        -- stdin = true,
      },
    },
  },
}
