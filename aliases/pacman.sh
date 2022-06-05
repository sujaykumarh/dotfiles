#########
## pacman Aliases
#########

# return if pacman is not installed
if [[ `which pacman` == "pacman not found" ]]; then
    return
fi

## pacman clear cache
_pacmanClearCache(){
    echo "running pacman -Scc"
    sudo pacman -Scc
}
alias pacman-clean-cache="_pacmanClearCache"


## pacman list packages installed other than official ones eg: aur, etc..
_pacmanListOther(){
    echo "running pacman -Qqem"
    sudo pacman -Qqem
}
alias pacman-list-other="_pacmanListOther"

