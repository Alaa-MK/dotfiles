vim.g.root_spec = { "cwd" }

vim.filetype.add({
  pattern = {
    ["%.env.*"] = "sh",
    ["Jenkinsfile.*"] = "groovy",
    ["%.gitconfig.*"] = "gitconfig",
    ["${HOME}/.ssh/config.*"] = "sshconfig",
  },
})
