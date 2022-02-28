####################
##  KDE Aliases   ##
####################






### KDE - Plasma 


# return if kstart5 is not installed
if [[ `which kstart5` == "kstart5 not found" ]]; then
    return
fi

# return if kquitapp5 is not installed
if [[ `which kquitapp5` == "kquitapp5 not found" ]]; then
    return
fi
alias kPlasmaRestart="kquitapp5 plasmashell; kstart5 plasmashell"
