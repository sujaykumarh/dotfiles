## OH-MY-ZSH COMP DUMP LOCATION
#export ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.cache/zsh/compdump/.zcompdump-${ZSH_VERSION}"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac


# Source local.env
[[ -f $DOTFILES_DIR/local.env ]] && source $DOTFILES_DIR/local.env || echo "$DOTFILES_DIR/local.env not found. run init.sh in $DOTFILES_DIR"


# Vars
HISTFILE=~/.zsh_history
HISTCONTROL=ignoreboth
SAVEHIST=1000
setopt inc_append_history # To save every command before it is executed
setopt share_history # setopt inc_append_history

# Aliases
source $DOTFILES_DIR/aliases/default.sh

# Settings
# source $DOTFILES_DIR/zsh/plugins/fixls.zsh

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'



# for profile
source $DOTFILES_DIR/modules/zsh/zsh_profile.sh


# source keybindings
source $DOTFILES_DIR/modules/zsh/keybindings.sh