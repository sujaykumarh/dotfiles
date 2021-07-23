#!/bin/sh

# ######################################################
# ## Copyright (c) 2021, Sujaykumar. Hublikar         ##
# ## Licensed under the Apache License, Version 2.0   ##
# ######################################################

# echo $varHERE | rev | cut -f 1-2 -d '/' | rev`

## Init dotfiles
CURRENT_DIR=`pwd`

## Git
GIT_CFG="git.cfg"
GIT_CFG_EXAMPLE="git.cfg.example"
    
if [ -f $GIT_CFG ]; then
    echo "$GIT_CFG alreay exists. remove it and re-run init.sh"
else
    cp $CURRENT_DIR/$GIT_CFG_EXAMPLE $CURRENT_DIR/$GIT_CFG
    echo "copied $GIT_CFG_EXAMPLE >> $GIT_CFG"
    echo "edit $GIT_CFG file."
fi

## Default Dotfiles config
DOTFILES_CFG="default.env"
DOTFILES_CFG_EXAMPLE="local.env"
    
if [ -f $DOTFILES_CFG ]; then
    echo "$DOTFILES_CFG alreay exists. remove it and re-run init.sh"
else
    cp $CURRENT_DIR/$DOTFILES_CFG_EXAMPLE $CURRENT_DIR/$DOTFILES_CFG
    echo "copied $DOTFILES_CFG_EXAMPLE >> $DOTFILES_CFG"
    echo "edit $DOTFILES_CFG file."
fi


## Init Submodules
git submodule update --init --recursive