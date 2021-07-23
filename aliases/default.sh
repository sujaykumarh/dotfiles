#####
## Default Aliases
#####

export DOTFILES_DIR="$DOTFILES_DIR"

# Set Crontab editor default
# export VISUAL=vim
export VISUAL="$DEFAULT_CRONTAB_EDITOR"

# Aliases

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias youtube-dl='noglob youtube-dl' # fix for youtube-dl
alias v="vim -p"

# GREP command
alias grep="grep --color=always"


# Custom cd
cdls() {
    #cd $1 && ls
    builtin cd "$@" && ls;
}
alias cd="cdls"


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'