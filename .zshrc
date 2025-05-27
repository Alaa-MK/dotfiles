# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

ZSH_THEME=""
BAT_THEME="base16-256"

# History file size
HISTSIZE=1000000
SAVEHIST=1000000

plugins=(git zsh-autosuggestions zsh-syntax-highlighting colored-man-pages history-substring-search docker docker-compose kubectl fzf web-search tmux ls)

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

# tmux configs (must be defined before sourcing oh-my-zsh)
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_DEFAULT_SESSION_NAME=main

export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_DEFAULT_COMMAND='find .'
export FZF_CTRL_T_COMMAND='find .'
export FZF_COMPLETION_TRIGGER='**'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

export ANDROID_HOME='/opt/homebrew/Caskroom/android-sdk/4333796'
export JAVA_HOME="/opt/homebrew/Cellar/openjdk/21/libexec/openjdk.jdk/Contents/Home"
export PIPX_DEFAULT_PYTHON="$HOME/.asdf/shims/python3"

path=(
    "$HOME/.local/bin"
    "/opt/homebrew/bin"
    "/opt/homebrew/opt/openjdk/bin"
    "/opt/homebrew/opt/mysql-client/bin"

    # Go
    "$HOME/go/bin"

    # Python
    "$HOME/Library/Python/3.9/bin"

    # Rust
    "$HOME/.cargo/bin"
    "$HOME/.rustup/toolchains/stable-aarch64-apple-darwin/bin"

    # Ruby
    "/opt/homebrew/opt/ruby/bin"
    "/opt/homebrew/lib/ruby/gems/3.4.0/bin"

    # Android
    "$ANDROID_HOME/4333796/tools"
    "/opt/homebrew/Caskroom/android-platform-tools"

    $path
)
typeset -U path  # Remove duplicates from PATH
export PATH

# Use Vim mode in Zsh
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# WARNING: The plugin overrides some key bindings. Refer to this link to fix key bindings for specific plugins: https://github.com/jeffreytse/zsh-vi-mode/tree/master?tab=readme-ov-file#execute-extra-commands
# wrapping the `bindkey` in `zvm_after_init` is needed if you're using the zsh-vi-mode plugin
function zvm_after_init() {
    eval "$(fzf --zsh)"
    
    # Autocomplete accept key
    bindkey '^ ' autosuggest-accept
}

# Source zsh configs
source ~/.zsh/pure.zsh
source ~/.zsh/zoxide.zsh
source $ZSH/oh-my-zsh.sh
source ~/.zsh/aliases-utils.zsh

# load personal configs, if any (includes secrets as well as personal/work-specific configs)
if [[ -f ~/.zsh-personal/main.zsh ]]; then
    source ~/.zsh-personal/main.zsh
fi

export ASDF_NODEJS_AUTO_ENABLE_COREPACK=1

. /$HOME/.asdf/asdf.sh
export PATH="$HOME/.asdf/shims:$PATH"

# Zoxide
eval "$(zoxide init zsh)"
