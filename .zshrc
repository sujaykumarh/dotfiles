# replaced on install
DOTFILES_DIR="PATH_TO_DOTFILES"

export DOTFILES_DIR=$DOTFILES_DIR

# Install Git moudules
echo "Updating git modules"
(cd $DOTFILES_DIR && git submodule update --init --recursive && reset)

# use zshrc
source $DOTFILES_DIR/zsh/zshrc.sh