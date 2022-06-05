
## Speed Test 
#   source  : https://github.com/sivel/speedtest-cli
#   path    : $DOTFILES_DIR/scripts/speedtest.py

if [[ `which python` == "python not found" ]]; then
    # echo "Python not found! Please install python"
    return
fi

_speedtest(){

    echo "Running speed tester."
    echo ""


    if [ $# -eq 0 ];
    then
        ## By default try secure https insted of http
        python $DOTFILES_DIR/scripts/speedtest.py --secure
        return
    fi

    python $DOTFILES_DIR/scripts/speedtest.py "$@"
}
alias speedtest=_speedtest