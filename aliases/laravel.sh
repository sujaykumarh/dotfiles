#########
## Laravel Aliases
#########

# return if docker is not installed
if [[ `which docker` == "docker not found" ]]; then
    return
fi

_checkPkg(){
    if [[ `which $1` == "$1 not found" ]]; then
        echo "$1 was not found! Please install $1"
        return 1
    fi
    return 0
}

DOCKER_COMPOSE_CMD='docker-compose run --rm'

_checkDockerComposeCommand(){
    CMD=$(docker-compose run --rm $1 2>&1)
    if [[ "$CMD" == "No such service: $1" ]]; then
        echo "create a service: $1 in your docker-compose.yml"
        return 1
    fi

    echo "docker-compose service '$1' found running"
    return 0
}

## Laravel
# ToDo: replace with script
alias lara-create="docker-compose run --rm -v $(pwd):/laravel sujaykumarh/laraondock:alpine composer create-project --prefer-dist laravel/laravel src"


## Artisan
_artisan(){
    if [ -f docker-compose.yml ]; then
        if _checkPkg docker-compose; then
            if _checkDockerComposeCommand artisan; then
                docker-compose run --rm artisan $@
            fi
        fi
    else
        # _checkPkg php
        if _checkPkg php; then
            if [ -f artisan ]; then
                echo "executing php artisan $@"
                php artisan $@
            else
                echo "artisan was not found! in current directory"
                echo "you can create a new laravel project using: lara-create"
            fi
        fi
    fi
}
alias artisan=_artisan

## Composer
_composer(){
    if [ -f docker-compose.yml ]; then
        if _checkPkg docker-compose; then
            if _checkDockerComposeCommand composer; then
                docker-compose run --rm composer $@
            fi
        fi
    else
        # _checkPkg php
        if _checkPkg composer; then
            echo "executing composer $@"
            /usr/local/bin/composer $@
        fi
    fi
}
alias composer=_composer