####
## fzf-tab config
####
# https://github.com/Aloxaf/fzf-tab/wiki/Preview

# export FZF_COMPLETION_OPTS='--border --info=inline --no-height'

# env vars
zstyle ':fzf-tab:complete:(-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'eval echo \$$word | head -200'

# system commands
zstyle ':fzf-tab:complete:(cat|nano|vi):*' fzf-preview '[[ -f $realpath ]] && head -n 200 $realpath || tree -C $realpath'
zstyle ':fzf-tab:complete:(tac):*' fzf-preview '[[ -f $realpath ]] && tac $realpath | head -n 200 || tree -C $realpath'
zstyle ':fzf-tab:complete:(cd|ls):*' fzf-preview '[[ -d $realpath ]] && tree -C $realpath || echo "is a file"'
zstyle ':fzf-tab:complete:(finfo):*' fzf-preview '[[ -f $realpath ]] && echo -e "is a file\n" && ls -l --color=always $realpath && echo -e "\n" || echo -e "is a directory\n";stat $realpath'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:ssh:*' fzf-preview 'echo $word'

# man <command>
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'

# git
zstyle ':fzf-tab:complete:git:*' fzf-preview 'git $word --help'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
zstyle ':fzf-tab:complete:git-branch:*' fzf-preview 'git log --oneline --color=always $word'

# TODO: add command help
# zstyle ':fzf-tab:complete:(-command-):*' fzf-preview ''