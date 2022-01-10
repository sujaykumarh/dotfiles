## 
# ToDo: break this into a separate file for each keybinding for easier configuration and maintenance
# ToDo: add a way to add customiziable defaults keybindings using env file
# ToDo: add a way to customize the keybindings using local.env file

# help: https://unix.stackexchange.com/a/117162

# up
function up_widget() {
	BUFFER="cd .."
	zle accept-line
}
zle -N up_widget
bindkey "^k" up_widget

# git
# [testing]: use gitmoji instead of git if available
if [ -x "$(command -v gitmoji)" ]; then
	# use gitmoji if available instead of git
	function gitmoji_prep() {
		if [ -z "$BUFFER" ]; then
			BUFFER="git add -A && gitmoji -c && git push"
		fi

		zle accept-line
	}
	zle -N gitmoji_prep
	bindkey "^g" gitmoji_prep
else
	# use default git if gitmoji is not available
	function git_prepare() {
		if [ -n "$BUFFER" ]; then
			BUFFER="git add -A && git commit -m \"$BUFFER\" && git push"
		fi

		if [ -z "$BUFFER" ]; then
			BUFFER="git add -A && git commit -v && git push"
		fi

		zle accept-line
	}
	zle -N git_prepare
	bindkey "^g" git_prepare
fi

# previous default ctrl+g command for git
# function git_prepare() {
# 	if [ -n "$BUFFER" ]; then
# 		BUFFER="git add -A && git commit -m \"$BUFFER\" && git push"
# 	fi

# 	if [ -z "$BUFFER" ]; then
# 		BUFFER="git add -A && git commit -v && git push"
# 	fi

# 	zle accept-line
# }
# zle -N git_prepare
# bindkey "^g" git_prepare

# home ctrl + alt + h
function goto_home() {
	BUFFER="cd ~/"$BUFFER
	zle end-of-line
	zle accept-line
}
zle -N goto_home
bindkey "^[^h" goto_home

# Edit and rerun
function edit_and_run() {
	BUFFER="fc"
	zle accept-line
}
zle -N edit_and_run
bindkey "^v" edit_and_run

# LS
function ctrl_l() {
	BUFFER="ls"
	zle accept-line
}
zle -N ctrl_l
bindkey "^l" ctrl_l

# Enter
function enter_line() {
	zle accept-line
}
zle -N enter_line
bindkey "^o" enter_line

# Sudo
function add_sudo() {
	BUFFER="sudo "$BUFFER
	zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo

# Reset and clear screen
function clearscr() {
	BUFFER="clear && reset"
	zle end-of-line
}
zle -N clearscr
bindkey "^r" clearscr
