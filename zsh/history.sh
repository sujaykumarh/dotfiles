#####
## Command history
#####

HISTFILE=~/.zsh_history
HISTCONTROL=ignoreboth
SAVEHIST=1000

setopt inc_append_history # To save every command before it is executed
setopt share_history 


setopt hist_ignore_dups # don't record duplicate commands
setopt hist_ignore_all_dups # don't record commands that are duplicates of previous commands
setopt hist_reduce_blanks # remove duplicate blanks from history

function zshaddhistory() {
    emulate -L zsh

    # do not add to history if the command is gitmoji commit
    if [[ $1 = *"gitmoji -c"* ]] ; then
        return 1
    fi
}