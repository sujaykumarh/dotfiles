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




# VS Code
_vscode(){
    if [[ `which code` == "code not found" ]]; then
        echo "vs-code was not found! Please install code"
        return
    fi

    VSCODE=`whereis code | cut -d " " -f2`
    CURDIR=`pwd`

    if [[ -z "$1" ]]; then
        # echo "no folder"
        $VSCODE $CURDIR
    else
        # echo "folder: $1"
        $VSCODE $1
    fi
}
alias code='_vscode'
alias c='_vscode'