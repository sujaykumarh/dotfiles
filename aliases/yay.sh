#########
## yay Aliases
#########

# return if yay is not installed
if [[ `which yay` == "yay not found" ]]; then
    return
fi

## yay clear cache
_yayClearCache(){
    yay -Scc
}
alias yay-clean-cache="_yayClearCache"

