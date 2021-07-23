
# dot not edit this is replaced with sed when installed
DOTFILES_DIR="DOTFILES_PATH_HERE"

export DOTFILES_DIR=$DOTFILES_DIR

# Install Git moudules
echo "Updating git modules"
(cd $DOTFILES_DIR && git submodule update --init --recursive && reset)

# use zshrc
source $DOTFILES_DIR/modules/zsh/zshrc.sh