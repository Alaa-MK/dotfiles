return {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      focus = false,
      filetype = {
        go = {
          "cd $dir && go run $fileName",
        },
      },
    })
  end,
}
