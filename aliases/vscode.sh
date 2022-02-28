#########
## VS Code Aliases
#########

_vscode(){
    if [[ `which code` == "code not found" ]]; then
        echo "vs-code was not found! Please install code"
        return
    fi

    VSCODE=`whereis code | cut -d " " -f2`
    CURDIR=`pwd`

    if [[ -z "$1" ]]; then
        # echo "no folder"
        $VSCODE $CURDIR
    else
        # echo "folder: $1"
        $VSCODE $@
    fi
}

alias code='_vscode'
alias c='_vscode'