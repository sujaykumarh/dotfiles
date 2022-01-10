
## Custom

####
## PATH
####
# Default
export PATH="/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/games"
# user
USER_BIN="$HOME/.local/bin"
export PATH=$PATH:$USER_BIN

####
## Flutter
####
FLUTTER_SDK="$HOME/flutter-sdk/flutter/bin"
if [[ -d $FLUTTER_SDK ]]; then
    export PATH=$PATH:$FLUTTER_SDK
fi

####
## NodeJS
####
NPM="$HOME/.npm-global/bin"
if [[ -d $NPM ]]; then
    export PATH=$PATH:$NPM
fi


####
## Composer
####
COMPOSER_BIN="$HOME/.config/composer/vendor/bin"
if [[ -d $COMPOSER_BIN ]]; then
    export PATH=$PATH:$COMPOSER_BIN
fi

####
## Snap
####
SNAP="/snap/bin"
if [[ `which snap` != "snap not found" ]]; then
    export PATH=$PATH:$SNAP
fi

####
## Ruby
####
if [[ `which ruby` != "ruby not found" ]]; then
    ## Full version
    #RUBY_VER=`ruby -v | perl -ne '/[0-9]+\.[0-9]+\.[0-9]+/ && print $&'`
    ## For path https://stackoverflow.com/a/7516599
    RUBY_VER=`ruby -v | perl -ne '/[0-9]+\.[0-9]+\./ && print $&'`0
    GEM_PATH="$HOME/.gem/ruby/$RUBY_VER/bin"
    export PATH=$PATH:$GEM_PATH
fi




# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable zsh plugins
# source $DOTFILES_DIR/zsh/plugins.sh

# FZF
# source $DOTFILES_DIR/modules/fzf/fzf.sh
# source $DOTFILES_DIR/modules/fzf/custom.fzf-tab.sh

## Load custom aliases
for _custom_alias in $DOTFILES_DIR/aliases/*.sh
do
	# echo $_custom_alias
    source $_custom_alias
done




## Source prompt
# source $DOTFILES_DIR/zsh/prompt.sh