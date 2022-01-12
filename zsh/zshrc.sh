#####
## Setup SHELL
#####

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac


# Source local.env
[[ -f $DOTFILES_DIR/local.env ]] && source $DOTFILES_DIR/local.env || echo "$DOTFILES_DIR/local.env not found. run init.sh in $DOTFILES_DIR"

# load basic requirements
source $DOTFILES_DIR/zsh/basic.sh

# Set zsh variables to use oh-my-zsh
ZSH=$DOTFILES_DIR/zsh/plugins/ohmyzsh
OHMYZSH=$ZSH
ZSH_CUSTOM=$ZSH/custom

# Load oh-my-zsh
source $OHMYZSH/oh-my-zsh.sh

# load customizations
source $DOTFILES_DIR/zsh/custom.sh
# load profile
source $DOTFILES_DIR/zsh/profile.sh

# load prompt
source $DOTFILES_DIR/zsh/prompt.sh

# load additional plugins
source $DOTFILES_DIR/zsh/plugins.sh

# load modules
source $DOTFILES_DIR/zsh/modules.sh

# load keybindings
source $DOTFILES_DIR/zsh/keybindings.sh