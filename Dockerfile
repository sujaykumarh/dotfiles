FROM alpine:latest as base


## Variables
ENV DEFAULT_USER=yoda \
    USER_HOME=/home/yoda \
    DOTFILES_DIR=/home/yoda/dotfiles


## Add Default packages
RUN apk add --no-cache \
    zsh fzf \
    nano \
    git

## SETUP USER

##
# username : ${DEFAULT_USER}
# group    : ${DEFAULT_USER}
# home dir [-h] / no password [-D] / default shell ash [-s]
##

RUN mkdir -p ${USER_HOME} && \
    addgroup -g 1000 ${DEFAULT_USER} && \
    adduser -D -G ${DEFAULT_USER} -g ${DEFAULT_USER} -s /bin/zsh ${DEFAULT_USER} -h ${USER_HOME}


## COPY FILES
COPY zsh ${DOTFILES_DIR}/zsh
COPY aliases ${DOTFILES_DIR}/aliases
COPY scripts ${DOTFILES_DIR}/scripts
COPY .docker/demo ${USER_HOME}/demo
COPY .docker/setup-demo.sh ${USER_HOME}/demo/setup-demo.sh
COPY .gitmodules ${DOTFILES_DIR}/.gitmodules
COPY .gitignore ${DOTFILES_DIR}/.gitignore
COPY default.env ${DOTFILES_DIR}/default.env
COPY .zshrc ${USER_HOME}/.zshrc


## cleanup
RUN chown -R ${DEFAULT_USER}:${DEFAULT_USER} ${USER_HOME}; \
    rm -rf /tmp/*;\
    rm -rf /var/tmp/*;\
    rm -rf /var/cache/apk/*;

## Set Default USER
USER ${DEFAULT_USER}

## Setup Dotfiles
RUN git config --global user.name ${DEFAULT_USER}; \
    git config --global user.email ${DEFAULT_USER}@localhost; \
    git config --global init.defaultBranch 'main'; \
    cd ${DOTFILES_DIR}; \
    cp default.env local.env; \
    git init; git add -A; git commit -am "latest"; \
    git submodule add https://github.com/ohmyzsh/ohmyzsh.git zsh/plugins/ohmyzsh &&\
    git submodule add https://github.com/zsh-users/zsh-completions.git zsh/plugins/zsh-completions &&\
    git submodule add https://github.com/zsh-users/zsh-autosuggestions.git zsh/plugins/zsh-autosuggestions &&\
    git submodule add https://github.com/Aloxaf/fzf-tab.git zsh/plugins/fzf-tab &&\
    git submodule add https://github.com/iridakos/goto.git zsh/plugins/goto &&\
    git add -A; git commit -am "add submodules"; \
    sed -i "s,PATH_TO_DOTFILES,${DOTFILES_DIR},g" ${USER_HOME}/.zshrc;


## Setup Demos
RUN cd ${USER_HOME}/demo && ./setup-demo.sh && \
    rm -rf ${USER_HOME}/demo/sample.package.json; \
    rm -rf ${USER_HOME}/demo/setup-demo.sh;

## Set Working DIR
WORKDIR ${USER_HOME}

## Default Command
CMD [ "/bin/zsh" ]