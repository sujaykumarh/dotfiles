#########
## VS Code Aliases
#########

# return if code is not installed
if [[ `which code` == "code not found" ]]; then
    return
fi

_vscode(){
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