#####
## Default Aliases
#####

export DOTFILES_DIR="$DOTFILES_DIR"

# Set Crontab editor default
# export VISUAL=vim
export VISUAL="$DEFAULT_CRONTAB_EDITOR"

# Aliases

alias ls='ls -CF --color=auto'
alias ll='ls -l'
alias llh='ls -lh'
alias la='ls -A'
alias lah='ls -lAh'
alias l='ls -CF'
alias v="vim -p"

# GREP command
alias grep="grep --color=always"


# Custom cd
cdls() {
    #cd $1 && ls
    builtin cd "$@" && ls;
}
alias cd="cdls"

