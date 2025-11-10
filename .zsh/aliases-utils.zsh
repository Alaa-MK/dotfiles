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
alias nvdp='nv_with_dir ~/.dotfiles/public'
alias nvdpr='nv_with_dir ~/.dotfiles/private'

# open a neovim plugin in nvim
function nvpl() {
  local plugin_dir=$(find ~/.local/share/nvim/lazy -maxdepth 1 -type d | xargs -I {} basename {} | fzf)
  if [ -z "$plugin_dir" ]; then
    echo "No plugin selected"
    return 1
  fi
  nv_with_dir ~/.local/share/nvim/lazy/$plugin_dir
}

# create a new neovim plugin config file from a github repo string
function nv-plugin() {
  if [[ -z "$1" ]]; then
    echo "Usage: nv-plugin owner/repo"
    return 1
  fi

  local plugin_string="$1"
  local repo_name="${plugin_string#*/}"
  local file_basename="${repo_name%.nvim}"
  local file_name="${file_basename}.lua"

  local plugins_dir="${HOME}/.dotfiles/public/.config/nvim/lua/plugins"
  local file_path="${plugins_dir}/${file_name}"

  if [[ ! -f "$file_path" ]]; then
    mkdir -p "$plugins_dir"
    print "return {\n  \"$plugin_string\",\n  opts = {},\n}" > "$file_path"
  fi

  nv "$file_path"
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
alias clr='clear'
alias pf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' --bind ctrl-n:preview-page-up,ctrl-m:preview-page-down"

# Exit the terminal with :q
alias :q="exit"

# Print colors
function colors() {
  local color_names=(
    "Black"
    "Red"
    "Green"
    "Yellow"
    "Blue"
    "Magenta"
    "Cyan"
    "White"
  )
  
  for i in {0..7}; do
    tput setaf $i
    printf "%-10s\n" "${color_names[i+1]}"
    tput sgr0
  done
}

function omz_plugin_search() {
  cat ~/.oh-my-zsh/plugins/$1/$1.plugin.zsh | grep alias | grep $2
}
