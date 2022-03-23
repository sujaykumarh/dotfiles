#!/bin/sh


########
## SETUP dotfiles for docker
########

# Prerequisites for docker
# SET setup.sh in DOTFILES_PATH to run this script

# Global variables
CURRENT_DIR=$(pwd)



# Setup local.env if not found
if [ ! -f "local.env" ]; then
    echo "local.env not found, creating..."
    cp default.env local.env
    echo ""
fi


######
## Load Submodules if not already done
#####

# usage _checkModule [dir] [module_repo]
_checkModule() {
    if [ ! -d $1 ]; then
        echo "$1 not found, pulling..."
        git submodule add $2 $1
        echo ""
    fi
}

_checkModule zsh/plugins/ohmyzsh                https://github.com/ohmyzsh/ohmyzsh.git
_checkModule zsh/plugins/zsh-completions        https://github.com/zsh-users/zsh-completions.git
_checkModule zsh/plugins/zsh-autosuggestions    https://github.com/zsh-users/zsh-autosuggestions.git
_checkModule zsh/plugins/fzf-tab                https://github.com/Aloxaf/fzf-tab.git
_checkModule zsh/plugins/goto                   https://github.com/iridakos/goto.git 


cd $HOME
