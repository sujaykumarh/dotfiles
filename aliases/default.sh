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




#### 
## clear dotfile clutter
####

## https://www.reddit.com/r/zsh/comments/fvtr19/no_more_dotfile_clutter_in_my_home/

export XDG_CACHE_HOME="$HOME"/.cache
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share


export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

export CARGO_HOME="$XDG_DATA_HOME"/cargo

export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks

export GNUPGHOME="$XDG_DATA_HOME"/gnupg


alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"