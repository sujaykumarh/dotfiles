#####
## Setup Keybindings
#####

# ToDo: break this into a separate file for each keybinding for easier configuration and maintenance
# ToDo: add a way to add customiziable defaults keybindings using env file
# ToDo: add a way to customize the keybindings using local.env file

# help: https://unix.stackexchange.com/a/117162

# go upa a directory
# ctrl + k
function up_widget() {
    BUFFER="cd .."
    zle accept-line
}
zle -N up_widget
bindkey "^k" up_widget

# perform git operations
# ctrl + g
function git_prepare() {
    (( $+commands[git] )) || return
    
	# ToDo: interactive prompt to perform a git actions
	_git_cmd="git status"
	_msg=""

    # if Branch Has Changes
    if [ $(git status --short | wc -l) -gt 0 ]; then
        # use gitmoji if available instead of git
        if [ -x "$(command -v gitmoji)" ]; then
			# if branch has staged changes
			if [ $(git diff --staged | wc -l) -gt 0 ]; then
				_msg="echo -e '\ncommiting staged changes \n\n`git diff --name-only --cached`\n';"
				_git_cmd="gitmoji -c"
			else
				_msg="echo -e '\nadding all changes and commiting \n\n`git status --short`\n';"
            	_git_cmd="git add -A && gitmoji -c"
			fi            
        else
			# use default git if gitmoji is not available
            if [ -n "$BUFFER" ]; then
                _git_cmd="git add -A && git commit -m \"$BUFFER\""
            fi
            
            if [ -z "$BUFFER" ]; then
                _git_cmd="git add -A && git commit -v"
            fi
        fi
    else
        # if no changes do something
    fi
	BUFFER="${_msg}${_git_cmd}"
    zle accept-line
}

zle -N git_prepare
bindkey "^g" git_prepare

# push to remote
# ctrl + p
function git_push() {
    # if in git directory
    if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then
        # ToDo: add options to push to remote
        BUFFER="git push"
    else
        # do something else
    fi
    zle accept-line
}
zle -N git_push
bindkey "^p" git_push

# go to user home 
# alt + ctrl + h
function goto_home() {
    BUFFER="cd ~/"$BUFFER
    zle end-of-line
    zle accept-line
}
zle -N goto_home
bindkey "^[^h" goto_home


# thefuck shortcut
# ctrl + f
function thefuck_key() {
    (( $+commands[thefuck] )) || return
    BUFFER="fuck"
    zle accept-line
}
zle -N thefuck_key
bindkey "^f" thefuck_key

# Edit and rerun
# function edit_and_run() {
#     BUFFER="fc"
#     zle accept-line
# }
# zle -N edit_and_run
# bindkey "^v" edit_and_run

# run ls command
# ctrl + l
function ctrl_l() {
    BUFFER="ls"
    zle accept-line
}
zle -N ctrl_l
bindkey "^l" ctrl_l

# insted of hitting Enter
# ctrl + o
function enter_line() {
    zle accept-line
}
zle -N enter_line
bindkey "^o" enter_line

# add sudo at the beginning of the line
# ctrl + s
function add_sudo() {
    BUFFER="sudo "$BUFFER
    zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo

# Reset and clear screen
# Alt + r
function clearscr() {
    BUFFER="clear && reset"
    zle end-of-line
}
zle -N clearscr
bindkey "^[r" clearscr
