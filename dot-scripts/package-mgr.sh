#!/bin/sh

# ######################################################
# ## Copyright (c) 2021, Sujaykumar. Hublikar         ##
# ## Licensed under the Apache License, Version 2.0   ##
# ######################################################

# Script to Manage packages for dotfiles
checkPackages(){
    # Usage: checkPackages pkgs_list

    echo "Checking required packages...."

    requiredPKGs=$@

    totalPKGsNeeded=0
    pkgsNeeded=""
    # loop required packages
    for _pkg in "${requiredPKGs[@]}"
    do
        # package not available
        if ! which $_pkg &>/dev/null ; then
            echo -e "⛔ $_pkg \twas not found and is required"
            let "totalPKGsNeeded+=1"
            pkgsNeeded="$pkgsNeeded $_pkg "
            continue
        fi

        echo -e "✅ $_pkg \tinstalled"
    done
    echo "" # emptyline

    if [ $totalPKGsNeeded -gt 0 ]; then
        echo "$totalPKGsNeeded packages are not installed and are needed"
        echo "pkgsNeeded: $pkgsNeeded"
    fi

    echo "" # emptyline
    pkgsNeeded=(`echo $pkgsNeeded | sed 's/ /\n/g'`)
    for _pkg in "${pkgsNeeded[@]}"
    do
        # echo -e "ask $_pkg \t tobe installed"
        _prompt_install $_pkg
    done
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
