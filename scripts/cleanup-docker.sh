#!/bin/sh

# ######################################################
# ## Copyright (c) 2021, Sujaykumar. Hublikar         ##
# ## Licensed under the Apache License, Version 2.0   ##
# ######################################################

# Docker Cleanup Script

## Colors
cRED="\033[0;31m"
cGREEN="\033[0;32m"
cBROWN="\033[0;33m"
cBLUE="\033[0;34m"
cPURPLE="\033[0;35m"
cCYAN="\033[0;36m"
cYELLOW="\033[1;33m"
cNC="\033[0m" # NO COLOR

#####################
##  ## YES / NO ## ##
#####################
## Usage 
## 
## askYN <command>
## 
## <command> to run when yes
## Default is No N
askYN(){
    local REPLY=""

    read -p "Are you sure? [y/N] " REPLY

    case $REPLY in     
        [yY]) 
            echo "OK!"
            $@
            # echo "$cGREEN{SUCCESS}$cNC"
        ;;

        *)
            echo "Action Cancelled"
        ;;    
    esac

    # echo
    echo            ## empty line
}

line(){
    # prints line across screen
    # Default +
    local w="$(tput cols)"
    local char=""
    [ "$1" = "" ] && char="+" || char="$1" ## default as +
    char="$(echo "$char" | awk '{print substr($0,0,2)}')" ## Get first char
    printf "%${w}s\n"|sed "s/ /$char/g" ## Print line of char
}

printf "$cCYAN"
line "#"
echo "# Cleaning up docker files from system"
line "#"
printf "$cNC"
echo            ## empty line


echo "Pruning Docker System [docker system prune]"
askYN docker system prune

echo "Pruning Docker Networks [docker network prune]"
askYN docker network prune

echo "Pruning Docker Volumes [docker volume prune]"
askYN docker volume prune


## Remove unused images
removeDockerImages(){
    local images="$(docker images --all -q | wc -l)"
    if [ $images -lt 1 ]; then 
        echo "No Docker Images Found on System"
        return
    fi

    echo            ## empty line
    echo "Removing these Images from system"
    echo            ## empty line
    docker images --all


    echo            ## empty line
    askYN docker rmi --force $(docker images --all -q)

    echo            ## empty line
    local txt=""
    [ $images -gt 1 ] && txt="Image's" || txt="Image" ## Replace text on number of images

    printf "$cGREEN{SUCCESS} $cRED Deleted $cNC $images Docker $txt "
    echo            ## empty line
}

## testing
# removeDockerImages

printf "$cRED[IMPORTANT]$cNC Remove docker images from system? This action cannot be undone"
askYN removeDockerImages

printf "$cGREEN"
line "#"
echo "# Pruning Docker from System Complete"
line "#"
printf "$cNC"
