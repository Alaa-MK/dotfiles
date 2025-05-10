fpath+=("$(brew --prefix)/share/zsh/site-functions")

autoload -U promptinit; promptinit

zstyle :prompt:pure:path color "#FF9E64"
zstyle :prompt:pure:prompt:success color "green"
zstyle :prompt:pure:git:dirty color "red"
zstyle :prompt:pure:execution_time color "red"
zstyle :prompt:pure:git:branch color 248

prompt pure
