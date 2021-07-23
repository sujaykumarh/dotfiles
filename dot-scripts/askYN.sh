#!/bin/sh

# ######################################################
# ## Copyright (c) 2021, Sujaykumar. Hublikar         ##
# ## Licensed under the Apache License, Version 2.0   ##
# ######################################################

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