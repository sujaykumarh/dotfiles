# Custom Dotfiles PROMPT

# _newline=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B'

# BoxDrawingCharacters https://en.wikipedia.org/wiki/Box-drawing_character

# Each component will draw itself, and hide itself if no information needs to be shown

# Git: branch/detached head, dirty status
prompt_git() {
  (( $+commands[git] )) || return
  if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
    return
  fi

  ### Git explaination
  #
  # 🌳 ✅     working tree clean
  # 🌱        git working
  # ⏳        changes made in current branch
  # ⚠️        default symbol
  # 💀        git not initilized

  _branch_name="----"
  _branch_char="⚠️"

  ## Is a git folder
  if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then

    if [ $(git branch --list | wc -l) -lt 1 ]; then 
      _branch_char="💀"
    else
      _branch_name="%{$bg[black]%}%{$fg[white]%} "
      _branch_name+="🌳 $(git rev-parse --abbrev-ref HEAD)"
    fi
    
    ## Branch Has Changes
		if [ $(git status --short | wc -l) -gt 0 ]; then 
			_branch_char="⏳"

			if [[ $_branch_current == "master" ]]; then
				_branchChar_color='red'
			else
				_branchChar_color='yellow'
			fi
    else
      _branch_char+=" ✅"
		fi


    ## Branch No. Of updates
    _branch_changes=""
    if [ $(git status --short | wc -l) -gt 0 ]; then
      _branch_changes="%{$bg[red]%}%{$fg[white]%}"
      _branch_changes+=" +$(git status --short | wc -l | awk '{$1=$1};1') "
    fi
    
  #   echo -e -n "\n│ 🌳 $CURRENT_BRANCH "
    _gitInfo="$_branch_char $_branch_name $_branch_changes"
    RPROMPT='%{$_lineup%} ${_gitInfo}%{$_linedown%}%{$reset_color%}% '
  fi
}


# User
prompt_user() {
  # Check the UID
  _user_color="%{$fg[blue]%}"
  if [[ $UID -eq 0 ]]; then # red root user
    _user_color="%{$fg[red]%}"
  fi	

  _user="${_user_color}%n%{$fg[cyan]%}@%{$fg[green]%}%m%{$reset_color%}"
  echo -n -e "\n${_user}" 
}

# Dir: current working directory
prompt_dir() {
  DIR=`pwd`

  # replace home with ~  help: https://stackoverflow.com/a/10037257
  [[ "$DIR" =~ ^"$HOME"(/|$) ]] && DIR="~${DIR#$HOME}"

  echo -n " [ $DIR ]" 
}

# End
prompt_end() {
  echo -e "\n╰─ $ " 
}

## Main prompt
build_prompt() {
  prompt_user
  prompt_dir
  prompt_end
}

PROMPT='$(build_prompt)'

## Right side of prompt
prompt_extra() {
  if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then
    # if in git directory
    prompt_git
  else
    # show time
    RPROMPT='%{$_lineup%} %{$fg[yellow]%}[%D{%L:%M:%S}] %{$_linedown%}%{$reset_color%}%'
  fi
}

prompt_extra
## Update RPROMPT Contineously https://askubuntu.com/a/360172
setopt PROMPT_SUBST
TMOUT=1
TRAPALRM() {
  prompt_extra
  zle reset-prompt
}
