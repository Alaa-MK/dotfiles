# ----------------
# Docker Commands
# ----------------
function dclr(){
	docker stop $(docker ps -a -q);
	docker rm $(docker ps -a -q);
}

# --------------------
# Nvim
# --------------------
function nv ()
{
  if [ -d "$1" ]; then  # directory
    nv_with_dir $1
  else                  # file
    nvim $@
  fi
}
function nv_with_dir() {
  nvim $1 -c "cd $1"
}
alias nvn='nv_with_dir ~/notes'
alias nvrest='nv_with_dir ~/rest.nvim'
alias nvdb='nv +"DBUI"'
alias nvaa='nv +"CopilotChat" +"only"'

# Dotfiles
alias nvdot='nv_with_dir ~/.dotfiles'

# open a neovim plugin in nvim
function nvpl() {
  local plugin_dir=$(find ~/.local/share/nvim/lazy -maxdepth 1 -type d | xargs -I {} basename {} | fzf)
  if [ -z "$plugin_dir" ]; then
    echo "No plugin selected"
    return 1
  fi
  nv_with_dir ~/.local/share/nvim/lazy/$plugin_dir
}

# --------------------
# Tmux
# --------------------
alias mux='tmuxinator'

# --------------------
# Eza
# --------------------
alias la="ls -lA" # Override oh my zsh alias, because eza flags are weird.

# --------------------
# Git
# --------------------
unalias gk # Remove the oh-my-zsh alias for gk to allow using gitkraken-cli

# --------------------
# Miscellaneous
# --------------------
alias pf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' --bind ctrl-n:preview-page-up,ctrl-m:preview-page-down"

# Exit the terminal with :q
alias :q="exit"

function omz_plugin_search() {
  cat ~/.oh-my-zsh/plugins/$1/$1.plugin.zsh | grep alias | grep $2
}
