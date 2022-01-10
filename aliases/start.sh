_start(){
    if [[ `which start` != "start not found" ]]; then
        start $@
        return
    fi


    if [[ `which node` == "node not found" ]]; then
        echo "node was not found! Please install node"
        return
    fi

    npx @sujaykumarh/start@latest $@
}

# make LICENSE file
alias mk-license="_start new license"

# make .gitignore file
alias mk-gitignore="_start new gitignore"

# make empty gitkeep file
alias mk-gitkeep="touch .gitkeep"
