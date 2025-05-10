function zoxide_fzf() {
    local orig_buffer=$LBUFFER
    local selection
    selection=$(zoxide query --list | fzf --height 40% --reverse --border) || {
        LBUFFER=$orig_buffer
        zle redisplay
        return 0
    }

    if [[ -n "$selection" ]]; then
        LBUFFER+="$selection"
        zle redisplay
    fi
}

zle -N zoxide_fzf
bindkey '^O' zoxide_fzf
