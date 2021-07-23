#!/bin/bash

# ######################################################
# ## Copyright (c) 2021, Sujaykumar. Hublikar         ##
# ## Licensed under the Apache License, Version 2.0   ##
# ######################################################

################################
## Install dotfiles on system ##
################################

###
## Global Variables
###

CURRENT_DIR=`pwd`

###
## import scripts
###


# import all `.sh` scripts in ./scripts folder
for script in $CURRENT_DIR/dot-scripts/*.sh
do
	# echo $script
    source $script
done


###
## Check Required Packages
###

requiredPKGs=(
	figlet		# figlet	- figlet
	zsh			# zsh 		- Shell
	fzf			# fzf 		- fuzzy finder
	util-linux
	# tmux		# tmux 		- tmux terminal
	# vim			# vim		- vim editor
)

# Check packages available
# pkgsIsRequired='true'
checkPackages $requiredPKGs


#####
## Backup old rc files and configs
#####
# TODO: make backup based on date&time to reload during uninstall
# TODO: dotfiles/backup/20211012_1432/files_here
_backupFile(){
	fromFile=$1
	toFile=$2
	if [ -f $fromFile ];then
		echo "backing up $fromFile >> backup/$toFile"
		cp $fromFile $CURRENT_DIR/backup/$toFile
	else
		echo -e "$fromFile \tnot found skipping.."
	fi
}
_backupFiles(){
	folder=`date -u +'%Y%m%d_%H%M'`
	[[ ! -d backup/$folder ]] && mkdir backup/$folder
	_backupFile ~/.zshrc $folder/zshrc.old
	_backupFile ~/.tmux.conf $folder/tmux.conf.old
	_backupFile ~/.vimrc $folder/vimrc.old
	_backupFile ~/.gitconfig $folder/gitconfig.old
}
echo -n "Backup old configs?"
askYN_defaultY _backupFiles


#####
## Load dotfiles rc files
#####
_copyFile(){
	fromFile=$1
	toFile=$2

	fromPath=`echo $fromFile | rev | cut -f 1-3 -d '/' | rev`
	toPath=`echo $toFile | rev | cut -f 1-3 -d '/' | rev`

	if [ -f $fromFile ];then
		echo -e "Copying: \t$fromPath >> $toPath"
		cp $fromFile $toFile
	else
		echo -e "NOTFOUND: \t$fromPath skipping..."
	fi
	echo ""
}

_loadrcFiles(){
	## Load ZSH rc
	echo "Copying zsh config..."
	_copyFile $CURRENT_DIR/modules/zsh/manager.sh ~/.zshrc
	sed -i "s,DOTFILES_PATH_HERE,$CURRENT_DIR,g" ~/.zshrc

	## Load Vim rc
	echo "Copying vim config..."
	_copyFile $CURRENT_DIR/modules/vim/vimrc.vim ~/.vimrc

	## Load tmux config
	# echo "Copying tmux config..."
	# _copyFile $CURRENT_DIR/modules/tmux/tmux.conf ~/.tmux.conf

	## Load fzf config
	# echo "Copying fzf config..."
	# _copyFile $CURRENT_DIR/modules/fzf/fzf.conf ~/.fzfrc

	## Load Git Config
	echo -n "Copy replace git config?"
	askYN _copyFile $CURRENT_DIR/git.cfg ~/.gitconfig
}

echo -e "\nLoading rc files in $USER dir"
_loadrcFiles



#####
## Install SHELL for user
#####
echo ""
echo "Current SHELL $SHELL"
if [ -z "${SHELL##*zsh*}" ];then
	echo "Current shell is zsh"
else
	echo -n "Default shell is not zsh. Set $USER Shell to zsh?"
	askYN chsh -s $(which zsh)
	[[ "$askYN_ANS" == 'y' ]] && echo "Shell changed! Please log out and log back in for default shell to be initialized."
	[[ "$askYN_ANS" != 'y' ]] && echo "zsh shell is not set as default shell, you will need zsh to be set as your shell to use this dotfiles and to be initialized."
fi


echo -e "\nDotfiles Installation done! exitting....."