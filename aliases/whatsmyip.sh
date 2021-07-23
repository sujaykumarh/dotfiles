## Find out System Hostname, External IP and internal ip using python script
_whatsMyIP(){
    if [[ `which python` == "python not found" ]]; then
        echo "Python not found! Please install python"
        return
    fi

    python $DOTFILES_DIR/scripts/whatsmyip.py "$@"
}
alias whatsmyip=_whatsMyIP