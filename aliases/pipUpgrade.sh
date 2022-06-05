#########
## pip upgrade
#########

if [[ `which python` == "python not found" ]]; then
    # echo "Python not found! Please install python"
    return
fi

if [[ `which pip` == "pip not found" ]]; then
    # echo "pip not found! Please install pip"
    return
fi

_pipUpgrade(){
    
    echo ""
    # local cmd='python -m pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1'
    local cmd='python -m pip list --outdated --format=freeze | cut -d = -f 1'

    local _usr="$USER"
    local _cmd="$cmd"
    local _cmdUpdate='python -m pip install --no-cache-dir -U'

    updatePip(){
        echo ""
        echo "##"
        echo "# Pip $_usr"
        echo "##"
        local items=`eval $cmd`
        local count=`echo $items | wc -l`

        if [[  $count -gt 1 ]]; then
            echo ""
            echo "[$_usr pip] Found $count packages out of date"

            echo ""
            echo "Found these packages Out of Date"
            echo "$items"

            # Update packages
            echo "\nUpdating"
            # echo $items | xargs -n1 echo
            echo `eval "$_cmd | xargs -n1 $_cmdUpdate"`
        else
            echo ""
            echo "[$_usr pip] No packages were found out of date."
        fi
    }

    # if root run only root
    if [[ $USER == "root" ]]; then
        updatePip
    else
        _usr="sudo"
        _cmd="sudo $cmd"
        _cmdUpdate="sudo $_cmdUpdate"
        updatePip

        _usr="$USER"
        _cmd="$cmd"
        _cmdUpdate="$_cmdUpdate"
        updatePip
    fi
}

alias update-pip-pkgs=_pipUpgrade