####
# docker and docker-compose
####

# TODO: replace with dedicated docker git ignore file
# make default  file
alias mk-dc-env="cp $DOTFILES_DIR/files/gitignore .gitignore"



####
## Init Projects
####

alias init-repo="rm -rf .git && git init"

alias mk-project-gh-action="git clone https://github.com/sujaykumarh/gh-action-js-template $@"

# TODO
# alias mk-project-docker="git clone https://github.com/sujaykumarh/docker-example-repo $@"

# alias mk-project-node="git clone https://github.com/sujaykumarh/node-example-repo $@"
# alias mk-project-npm="git clone https://github.com/sujaykumarh/npm-example-repo $@"
# alias mk-project-vuejs="git clone https://github.com/sujaykumarh/vuejs-example-repo $@"

# alias mk-project-python="git clone https://github.com/sujaykumarh/python-example-repo $@"

# alias mk-project-laravel="git clone https://github.com/sujaykumarh/laravel-example-repo $@"


####
## Git
####

# make default gitignore file
alias mk-gitignore="cp $DOTFILES_DIR/files/gitignore .gitignore"

# make empty gitkeep file
alias mk-gitkeep="touch .gitkeep"
