#!/bin/sh

# ######################################################
# ## Copyright (c) 2021, Sujaykumar. Hublikar         ##
# ## Licensed under the Apache License, Version 2.0   ##
# ######################################################

# ToDo: replace with one script (npm-cli) to manage dotfiles


## Setup script for dotfiles

## curl https://raw.githubusercontent.com/sujaykumarh/dotfiles/main/setup.sh | sh
## curl https://git.io/JBHRh | sh



### Global Variables
REPO_URL="https://github.com/sujaykumarh/dotfiles.git"
CLONE_DIR="$HOME/dotfiles"



# Ask YES or NO 

#####################
##  ## YES / NO ## ##
#####################
## Usage 
## 
## askYN <command>
## 
## <command> to run when yes
## Default is No N
askYN_ANS=''
askYN(){
    askYN_defaultN $@
}

askYN_defaultN(){
    local REPLY=""

    read -p " [y/N] " REPLY

    case $REPLY in     
        [yY]) 
            askYN_ANS='y'
            # echo "OK!"
            $@
            # echo "$cGREEN{SUCCESS}$cNC"
        ;;

        *)
            askYN_ANS='n'
            echo "Action Cancelled"
        ;;    
    esac
}

askYN_defaultY(){
    local REPLY=""

    read -p " [Y/n] " REPLY

    case $REPLY in     
        [nN])
            askYN_ANS='n'
            echo "Action Cancelled"
        ;;

        *) 
            askYN_ANS='y'
            # echo "OK!"
            $@
            # echo "$cGREEN{SUCCESS}$cNC"
        ;;

    esac
}



## Prompt for install based on os
#    from Parth/dotfiles source: https://github.com/Parth/dotfiles
_prompt_install() {
	echo -n "$1 is not installed. Would you like to install it?"

    # This could def use community support

    # Ubuntu
    if [ -x "$(command -v apt)" ]; then
        askYN_defaultY sudo apt install $1 -y
    elif [ -x "$(command -v apt-get)" ]; then
        askYN_defaultY sudo apt-get install $1 -y

    # Arch based Distro
    elif [ -x "$(command -v pacman)" ]; then
        askYN_defaultY sudo pacman -S $1
    elif [ -x "$(command -v yay)" ]; then
        askYN_defaultY sudo yay -S $1

    # 
    elif [ -x "$(command -v brew)" ]; then
        askYN_defaultY brew install $1

    #
    elif [ -x "$(command -v pkg)" ]; then
        askYN_defaultY sudo pkg install $1

    else
        echo "Not sure what your package manager is! Please install $1 on your own and run the install script again."
        exit
    fi

    # Action Cancelled
    # echo "askYN_ANS $askYN_ANS"
    if [ "$askYN_ANS" == "n" ];then
        echo -e "\n\n Packages are required please install these and run install script again."
        exit
    fi
}

installPkg(){
    # Usage     installPkg <pkg>
    _pkg=$1

    # package not available
    if ! which $_pkg &>/dev/null ; then
        echo -e "⛔ $_pkg \twas not installing"
        _prompt_install $_pkg
    else
        echo -e "✅ $_pkg \t already installed skipping..."
    fi
}

echo "Setting up required packages.."

## Install required
installPkg sudo
installPkg git

echo "Done! Setting up required packages"


if [ -d $CLONE_DIR ];then
    echo "$CLONE_DIR dir already exists, skipping...."
else
    echo "$CLONE_DIR dir does not exists, cloning...."
    git clone $REPO_URL $CLONE_DIR

    ## setup dotfiles
    echo "cd.. $CLONE_DIR"
    cd $CLONE_DIR

    ## install dotfiles
    # TODO: use menu.sh
    echo "Running dotfiles install script"
    sh install.sh
fi