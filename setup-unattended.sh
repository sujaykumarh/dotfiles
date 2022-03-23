#####
## dotfiles setup script - unattended
#####

# ######################################
# ### USE THIS SCRIPT WITH CAUTION
# ### PERFORMS A LOT OF ACTIONS UNATTENDED
# #####################################

# ########################################################################
# Copyright (C) 2022 Sujaykumar. Hublikar <hello@sujaykumarh.com>        #
# Licensed under the MIT License.                                        #
# ########################################################################

### Global variables
DOTFILES_DIR="$1"
CURRENT_DIR="$(pwd)"

echo "Setting up dotfiles in $DOTFILES_DIR"
echo "This script will perform a lot of actions without any confirmation"
echo ""
read -p "Do you wish to continue? " yn

case $yn in
    [Yy]* ) break;;
    [Nn]* ) echo "Aborting.." && exit 1;;
    * )  echo "Please answer y or n" && exit 1;;
esac

echo ""
echo "####### Performing actions #######"
echo ""

### Install packages
installPkg(){
    # Ubuntu / Debian
    if [ -x "$(command -v apt)" ]; then
        apt install $@ -y
    elif [ -x "$(command -v apt-get)" ]; then
        apt-get install $@ -y

    # Arch based Distro
    elif [ -x "$(command -v pacman)" ]; then
        pacman -S $@
    elif [ -x "$(command -v yay)" ]; then
        yay -S $@

    # Alpine Linux
    elif [ -x "$(command -v apk)" ]; then
        apk add --no-cache $@

    # Homebrew
    elif [ -x "$(command -v brew)" ]; then
        brew install $@

    # FreeBSD
    elif [ -x "$(command -v pkg)" ]; then
        pkg install $@

    # unknown
    else
        echo "Not sure what your package manager is! Exiting.."
        exit 1
    fi
}

packgeMgr(){
    # Ubuntu / Debian
    if [ -x "$(command -v apt)" ]; then
        echo "apt"
    elif [ -x "$(command -v apt-get)" ]; then
        echo "apt"

    # Arch based Distro
    elif [ -x "$(command -v pacman)" ]; then
        echo "arch"
    elif [ -x "$(command -v yay)" ]; then
        echo "arch"

    # Alpine Linux
    elif [ -x "$(command -v apk)" ]; then
        echo "alpine"

    # Homebrew
    elif [ -x "$(command -v brew)" ]; then
        echo "brew"

    # FreeBSD
    elif [ -x "$(command -v pkg)" ]; then
        echo "freebsd"

    # unknown
    else
        echo "UNKNOWN"
    fi

}

echo "Checking package manager"
case $(packgeMgr) in
    "arch")
        echo ""
        echo "** Arch Linux Found **"
        echo ""
        echo "Installing Arch packages"
        installPkg zsh fzf jq
        ;;
    "alpine")
        echo ""
        echo "** Alpine Linux Found **"
        echo ""
        echo "Installing Alpine packages"
        installPkg zsh fzf jq
        ;;
    "apt")
        echo ""
        echo "** Debian Based Linux Found **"
        echo ""
        echo "Installing apt packages"
        installPkg zsh fzf jq
        ;;
    "brew")
        echo ""
        echo "** Homebrew Found **"
        echo ""
        echo "Installing Homebrew packages"
        installPkg zsh fzf jq
        ;;
    "freebsd")
        echo ""
        echo "** FreeBSD Found **"
        echo ""
        echo "Installing FreeBSD packages"
        installPkg zsh fzf jq
        ;;
    *)
        echo ""
        echo "####### UNKOWN PACKGE MANAGER #######"
        echo ""
        echo "Not sure what your package manager is! Exiting.."
        exit 1
        ;;
esac


### get submodules zshrc
cd $DOTFILES_DIR
git submodule update --init --recursive

### Install zshrc
ZSHRC_FILE="${HOME}/.zshrc"
cp $DOTFILES_DIR/.zshrc $ZSHRC_FILE
sed -i "s,PATH_TO_DOTFILES,${DOTFILES_DIR},g" $ZSHRC_FILE


cd $CURRENT_DIR
echo ""
echo "####### dotfiles setup complete #######"
echo ""