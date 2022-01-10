
# [submodule "zsh/plugins/ohmyzsh"]
# 	path = zsh/plugins/ohmyzsh
# 	url = https://github.com/ohmyzsh/ohmyzsh.git
# [submodule "zsh/plugins/zsh-completions"]
# 	path = zsh/plugins/zsh-completions
# 	url = https://github.com/zsh-users/zsh-completions.git
# [submodule "zsh/plugins/fzf-tab"]
# 	path = zsh/plugins/fzf-tab
# 	url = https://github.com/Aloxaf/fzf-tab.git
# [submodule "modules/goto"]
# 	path = modules/goto
# 	url = https://github.com/iridakos/goto.git
# [submodule "zsh/plugins/zsh-autosuggestions"]
# 	path = zsh/plugins/zsh-autosuggestions
# 	url = https://github.com/zsh-users/zsh-autosuggestions.git

add_submodule(){
    git submodule add $@
}

add_submodule https://github.com/ohmyzsh/ohmyzsh.git zsh/plugins/ohmyzsh
add_submodule https://github.com/zsh-users/zsh-completions.git zsh/plugins/zsh-completions
add_submodule https://github.com/zsh-users/zsh-autosuggestions.git zsh/plugins/zsh-autosuggestions
add_submodule https://github.com/Aloxaf/fzf-tab.git zsh/plugins/fzf-tab

# git submodule update --init --recursive