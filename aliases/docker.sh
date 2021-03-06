####################
## Docker Aliases ##
####################

# return if docker is not installed
if [[ `which docker` == "docker not found" ]]; then
    return
fi

_dkFlushUnused(){
    # remove unused containers
    [ -z $(docker ps -a -q) ] && echo "no unused containers were found!" || docker rm $(docker ps -a -q)
    # remove untagged images
    [ -z $(docker images -q --filter "dangling=true") ] && echo "no untagged images were found!" || docker rmi $(docker images -q --filter "dangling=true")
}

## Docker
alias dk="docker"   # short for docker
alias dkpull="docker pull"   # short for Pull Docker image

## Images
alias dki="docker images" # Docker images list
alias dkrmi="docker rmi" # short for docker remove image
alias dkflush=_dkFlushUnused # flush unused containers and images
# alias dkflush="docker rm `docker ps --no-trunc -aq`" # flush remove all images
# alias dkflush2="docker rmi $(docker images --filter "dangling=true" -q --no-trunc)" # flush remove all images dangling

## Process
alias dkps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias dkps-default="docker ps"
# alias dkps="docker ps --format '{{.ID}} ~ {{.Names}} ~ {{.Status}} ~ {{.Image}}'" # Custom format for docker ps
alias dkpsl="docker ps -a"

alias dkps-kill="docker kill"
alias dkps-killall="[ -z $(docker container ls -q) ] && echo no containers to kill || docker stop $(docker container ls -q)"

## Service
alias dks="docker service"

## Logs
alias dkl="docker logs" # doocker logs
alias dklf="docker logs -f" # docker logs follow

## Containers
alias dkrm="docker rm" # short for docker remove
alias dkexe="docker exec"
alias dkexeit="docker exec -it"

## RUNN Containers
alias dkr="docker run" # Docker run container
alias dkrm="docker run --rm" # Docker run and remove after close
alias dkrmit="docker run --rm -it" # Docker run and remove remove with interactive



## Docker-Machine
## https://docs.docker.com/machine/install-machine/

# short for docker-machine
alias dm="docker-machine"

# docker-machine SSH
alias dmx="docker-machine ssh"

##
# Docker-Compose
# https://docs.docker.com/compose/install/
##

# support for docker compose v2 cli to use docker compose insted of docker-compose
DOCKER_COMPOSE_BIN='docker compose'

# check if docker-compose is installed else
if [[ `which docker-compose` == "docker-compose not found" ]]; then
    # alias docker-compose to use docker compose
    alias docker-compose="$DOCKER_COMPOSE_BIN"
else
    # use docker-compose binary
    DOCKER_COMPOSE_BIN='echo -e "\n\ndocker-compose v1 is being deprecated, please use docker-compose v2\n\n"; docker-compose'
fi

## Short for docker compose
alias dcr="${DOCKER_COMPOSE_BIN}"

## Docker Compose build
alias dcrbuild="${DOCKER_COMPOSE_BIN} build"

## Docker Compose Build run in detach mode pull container up
alias dcrbuildrun="${DOCKER_COMPOSE_BIN} up -d --build"

## Docker Compose RUN Container
alias dcrun="${DOCKER_COMPOSE_BIN} run"

## Docker Compose RUN and remove Container
alias dcrunrm="${DOCKER_COMPOSE_BIN} run --rm"

## Docker Compose template
# alias dcr="${DOCKER_COMPOSE_BIN}"


##################################
## Custom Docker Cleaner Script ##
##################################
alias docker-cleanup="sh $DOTFILES_DIR/scripts/cleanup-docker.sh"
alias docker-cleanUntagged='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'

# CURRENT_USER is used for docker user mount
export CURRENT_UID="$(id -u)"
export CURRENT_GID="$(id -g)"
export CURRENT_USER="$(id -u):$(id -g)"
