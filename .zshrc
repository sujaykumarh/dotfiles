DOTFILES_DIR="~/dotfiles"

export DOTFILES_DIR=$DOTFILES_DIR

# Install Git moudules
echo "Updating git modules"
(cd $DOTFILES_DIR && git submodule update --init --recursive && reset)

# use zshrc
source $DOTFILES_DIR/zsh/zshrc.sh