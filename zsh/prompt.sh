#####
## Setup prompt
#####

# prompt: node app directory with changes
#
# user@host [ ~/path/to/node-app ] 🌿 main 📦 v1.0.0
#  ➜ 

# prompt: git directory with changes
#
# user@host [ ~/path/to/dir ] 🌿 main               ⏳ +1
#  ➜ 

# prompt: git directory upto date
#
# user@host [ ~/path/to/dir ] 🌿 main                  ✅
#  ➜ 

# prompt: default non git directory
#
# user@host [ ~/path/to/dir ]                  
#  ➜ 

# prompt: when sudo is active
#
# user@host 🔓sudo [ ~/path/to/dir ]                  
#  ➜ 

# _newline=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B'


##########################
######## PROMPT ##########
##########################

# start
prompt_start(){
  echo -n -e "\n"
}

# User
prompt_user() {
  # Check the UID
  _user_color="%{$fg[blue]%}"
  if [[ $UID -eq 0 ]]; then # red root user
    _user_color="%{$fg[red]%}"
  fi	

  _user="${_user_color}%n%{$fg[cyan]%}@%{$fg[green]%}%m%{$reset_color%}"
  echo -n -e "${_user}" 
}

prompt_sudo() {
  (( $+commands[sudo] )) || return

	# If the user has sudo, make it a bit more obvious
  if [ $(sudo -n true 2>&1 | wc -l) -lt 1 ]; then
    echo -n " %{$fg[red]%}🔓sudo%{$reset_color%}"
	fi
}

# Dir: current working directory
prompt_dir() {
  DIR=`pwd`

  # replace home with ~  help: https://stackoverflow.com/a/10037257
  [[ "$DIR" =~ ^"$HOME"(/|$) ]] && DIR="~${DIR#$HOME}"

  echo -n " [ $DIR ]" 
}

prompt_git() {
  (( $+commands[git] )) || return

  # if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
  #   return
  # fi

  ## if it is not a git folder
  if [[ -z "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]]; then
    return
  fi

  ## if it is a git folder
  if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then
    _branch_name="---"
    
    # if project is new
    if [ $(git branch --list | wc -l) -lt 1 ]; then
      _branch_name="🌱 %{$fg[white]%}"
    else
      _branch_name="🌿 %{$fg[white]%}$(git rev-parse --abbrev-ref HEAD)"
    fi

    # Display git info
    echo -n -e " ${_branch_name}"
  fi

  # add Git tag
  prompt_git_tag
}


# Prompt: git tag on current commit
prompt_git_tag(){
  # Return if git is not installed
  (( $+commands[git] )) || return

  # Return if not in a git folder
  if [[ -z "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]]; then
    return
  fi

  # return if no commits
  if [ $(git branch --list | wc -l) -lt 1 ]; then
    return
  fi

  # return if no tags
  if [[ -z "$(git describe --exact-match --tags $(git log -n1 --pretty='%h') 2&>/dev/null)" ]]; then
    return
  fi

  echo -n -e " 🏷️ $(git describe --exact-match --tags $(git log -n1 --pretty='%h') 2&>/dev/null) "
}

# Package Version (if available)
prompt_package(){
  # Currently only works for npm
  if [[ -z "$(command -v jq)" ||  ! -f "package.json" ]]; then
    return
  fi
  echo -n -e " 📦 v$(jq -r '.version' package.json)"
}

# End
prompt_end() {
  #  ➜ character U+279C
  echo -e "\n ➜  " 

  # additional characters: https://en.wikipedia.org/wiki/Box-drawing_character
}

build_prompt() {
  prompt_start
  prompt_user
  prompt_sudo
  prompt_dir
  prompt_git
  prompt_package
  prompt_end
}

PROMPT='$(build_prompt)'

###########################
######## RPROMPT ##########
###########################

git_info(){
  (( $+commands[git] )) || return
  
  # if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
  #   return
  # fi

  ## if it is not a git folder
  if [[ -z "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]]; then
    return
  fi

  if [ $(git branch --list | wc -l) -lt 1 ]; then
    # if project is new
    echo "---"
  else
    # if Branch Has Changes
    if [ $(git status --short | wc -l) -gt 0 ]; then
      _branch_changes="%{$bg[green]%}%{$fg[white]%}"
      _branch_changes+=" +$(git status --short | wc -l)"

      echo -e "⏳ ${_branch_changes}"
    else
      echo -e "✅"
    fi
  fi
}

build_rprompt() {
  git_info
}

RPROMPT='%{$_lineup%}% $(build_rprompt) %{$_linedown%}%{$reset_color%}%'


# TODO: Breaks highlighting or fzf or autocomplete
####
## Reset the prompt after 10 seconds
####
# TMOUT=10
# TRAPALRM() zle reset-prompt
