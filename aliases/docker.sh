####################
## Docker Aliases ##
####################

# return if docker is not installed
if [[ `which docker` == "docker not found" ]]; then
    return
fi

## Docker
alias dk="docker"   # short for docker
alias dkpull="docker pull"   # short for Pull Docker image

## Images
alias dki="docker images" # Docker images list
alias dkrmi="docker rmi" # short for docker remove image
alias dkflush="docker rm `docker ps --no-trunc -aq`" # flush remove all images
alias dkflush2="docker rmi $(docker images --filter "dangling=true" -q --no-trunc)" # flush remove all images dangling

## Process
alias dkps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias dkps-default="docker ps"
# alias dkps="docker ps --format '{{.ID}} ~ {{.Names}} ~ {{.Status}} ~ {{.Image}}'" # Custom format for docker ps
alias dkpsl="docker ps -a"

alias dkps-kill="docker kill"
alias dkps-killall="docker kill $(docker container ls -q)"

## Service
alias dks="docker service"

## Logs
alias dkl="docker logs" # doocker logs
alias dklf="docker logs -f" # docker logs follow

## Containers
alias dkrm="docker rm" # short for docker remove
alias dkexe="docker exec -it $1 $2"

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

## Short for docker compose
alias dcr="docker-compose"

## Docker Compose build
alias dcrbuild="docker-compose build"

## Docker Compose Build run in detach mode pull container up
alias dcrbuildrun="docker-compose up -d --build"

## Docker Compose RUN Container
alias dcrun="docker-compose run"

## Docker Compose RUN and remove Container
alias dcrunrm="docker-compose run --rm"

## Docker Compose template
# alias dcr="docker-compose"


##################################
## Custom Docker Cleaner Script ##
##################################
alias docker-cleanup="sh $DOTFILES_DIR/scripts/cleanup-docker.sh"


# CURRENT_UID is used for docker user mount
# CURRENT_UID=$(id -u):$(id -g)
export CURRENT_UID="$(id -u):$(id -g)"
