#####
## Basic requirements
#####

# load history settings
source $DOTFILES_DIR/zsh/history.sh

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


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

## OH-MY-ZSH COMP DUMP LOCATION
# export ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.cache/zsh/compdump/.zcompdump-${ZSH_VERSION}"

alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"