# replaced on install
DOTFILES_DIR="PATH_TO_DOTFILES"

export DOTFILES_DIR=$DOTFILES_DIR

# Update submodules to latest
if [ -f "$DOTFILES_DIR/.gitmodules" ]; then
    # Install Git moudules
    echo "Updating git modules"
    (cd $DOTFILES_DIR && git submodule update --init --recursive && reset)
fi

# load zshrc
source $DOTFILES_DIR/zsh/zshrc.sh
