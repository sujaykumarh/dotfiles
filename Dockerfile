FROM alpine:latest as base


## Variables
ENV DEFAULT_USER=yoda \
    USER_HOME=/home/yoda \
    DOTFILES_DIR=dotfiles

ENV DOTFILES_PATH=${USER_HOME}/${DOTFILES_DIR}

## SETUP USER

##
# username : ${DEFAULT_USER}
# group    : ${DEFAULT_USER}
# home dir [-h] / no password [-D] / default shell ash [-s]
##

RUN mkdir -p ${USER_HOME} && \
    addgroup -g 1000 ${DEFAULT_USER} && \
    adduser -D -G ${DEFAULT_USER} -g ${DEFAULT_USER} -s /bin/zsh ${DEFAULT_USER} -h ${USER_HOME}


## Add Default packages
RUN apk add --no-cache \
    zsh jq fzf \
    nano \
    git

## cleanup
RUN rm -rf /tmp/*; \
    rm -rf /var/tmp/*; \
    rm -rf /var/cache/apk/*;

## Set Default USER
USER ${DEFAULT_USER}

## Set Working DIR
WORKDIR ${USER_HOME}


# Clone required plugins && setup basic git
RUN mkdir -p ${USER_HOME}/demo; mkdir -p ${DOTFILES_PATH} ;\
    cd ${DOTFILES_PATH} && \
    git config --global user.name "${DEFAULT_USER}"; \
    git config --global user.email "${DEFAULT_USER}@localhost"; \
    git config --global init.defaultBranch 'main';  \
    git config --global core.editor nano; \
    [ -d ".git" ] && rm -rf .git; \
    git init;

## COPY FILES
COPY .zshrc ${USER_HOME}/.zshrc
COPY .docker/demo ${USER_HOME}/demo
COPY .docker/setup-demo.sh ${USER_HOME}/setup-demo.sh
COPY .docker/setup.sh ${DOTFILES_PATH}/docker-setup.sh
COPY . ${DOTFILES_PATH}
COPY .gitignore ${DOTFILES_PATH}/.gitignore

## change to root
USER root

## chown
RUN chown -R ${DEFAULT_USER}:${DEFAULT_USER} ${USER_HOME};
    

## Set Default USER
USER ${DEFAULT_USER}



## Setup Dotfiles & Demo
RUN cd ${USER_HOME} ;\    
    sed -i "s,PATH_TO_DOTFILES,${DOTFILES_PATH},g" ${USER_HOME}/.zshrc; \
    cd ${DOTFILES_PATH}; sh docker-setup.sh; \
    cd ${USER_HOME}; sh setup-demo.sh; \
    rm -rf ${DOTFILES_PATH}/docker-setup.sh; \
    rm -rf ${USER_HOME}/setup*; \
    rm -rf ${USER_HOME}/demo/sample.package.json; \
    cd ${DOTFILES_PATH}; git add -A; git commit -am "latest";
    

## Set Working DIR
WORKDIR ${USER_HOME}

## Default Command
CMD [ "/bin/zsh" ]