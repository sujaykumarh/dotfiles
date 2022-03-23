**Note**


**dotfiles is currently in process of being re-imagined with all new architecture. checkout `main` branch for stable implementation before restructure or please wait untill this text is removed from default branch**

<br>
<br>

<div align="center">

<img src="https://raw.githubusercontent.com/sujaykumarh/dotfiles/dev/.github/media/icon.svg" height="64">

# dotfiles

my `zsh` dotfiles, for all my workstations. 

[![LICENSE](https://img.shields.io/badge/license-MIT-blue?logo=github&color=blue)](https://github.com/sujaykumarh/dotfiles/blob/main/LICENSE) [![wiki](https://img.shields.io/badge/Read-Wiki-blue?logo=github&color=blue)](https://github.com/sujaykumarh/dotfiles/wiki) [![GitHub issues](https://img.shields.io/github/issues/sujaykumarh/dotfiles?color=orange)](https://github.com/sujaykumarh/dotfiles/issues)

<p align="center">
<sub> to get started clone </sub>
<br>
<!-- ToDo replace with setup script -->
<h3>git clone https://github.com/sujaykumarh/dotfiles.git</h3>
</p>

**powered by** `zsh` with [oh-my-zsh](https://ohmyz.sh/) and more..


<!-- **default 🌿**: `dev` -->

<!--

**setup**

```bash
# ToDo replace with setup script
```

-->

<br>

[![demo](https://raw.githubusercontent.com/sujaykumarh/dotfiles/dev/.github/media/demo.gif)](#)

[![screenshot](https://raw.githubusercontent.com/sujaykumarh/dotfiles/dev/.github/media/ss.png)](#)

</div>

<br>

## ⚠️ DISCLAIMER

**the security of your systems is YOUR responsibility**. Be careful when using setup scripts. **`setup-unattended.sh` does lot actions unattended**  read the script before running it.

This project was created for personal use. Use it at your own risk.

<br>

## 🎮 Demo

run docker image

```bash
# pull docker image TAG=latest, dev
$ docker pull ghcr.io/sujaykumarh/dotfiles:<TAG>

# Run docker container
$ docker run --rm -it ghcr.io/sujaykumarh/dotfiles:<TAG>

# list files
$ ls

# checkout demos folder
$ cd demos
```

<br>

## 🔧 Installation, 🚀 Usage, 🔨 Configuration, etc.

read 👉 [Wiki](https://github.com/sujaykumarh/dotfiles/wiki)

<br>

## 📝 Contributing

All Contributions are welcome, see [CONTRIBUTING](https://github.com/sujaykumarh/.github/blob/main/.github/CONTRIBUTING.md).

<br>

## ℹ️ Other Info

**⚖️ Stability**

<sub> branch info and its stability </sub>

branch |  | description
--- | --- | ---
main | ⚠️ stable | stable branch
dev | 🛠️ WIP | active development

<br>

**🔌 Modules**

all modules available for config.

plugin | available | tested | working | usage |
------ | --------- | ------ | ------- | ----- |
fzf     | ☑️ | ☑️ | ☑️ | autocomplete, fuzzy search & more..
fzf-tab | ☑️ | ☑️ | ☑️ | autocomplete commands & more..
[goto](https://github.com/iridakos/goto) | ☑️ | ☑️ | ☑️ | jump to dir aliases
vim     | ⬛ | ⬛ | ⬛ |
tmux    | ⬛ | ⬛ | ⬛ |
<!-- tmux    | ☑️ | ⬛ | ⬛ | -->

<sub>☑️ working, ⬛ no-status, ❌ not-supported</sub>

<br>

**💻 Supported Systems**

<sub>If you would like to add support / publish test results create issue or pr all contributions are welcome</sub>

OS | Supported | Tested | description
--------------- | -- | -- | ---
ArchLinux       | ☑️ | ☑️ | working and tested
Ubuntu          | ☑️ | ☑️ | working and tested on v20.04+
Unix            | ☑️ | ⬛ | should work else create issue
MacOS           | ⬛ | ❌ | create issue or pr for support <br><sub>should probably work</sub> 
Windows         | ❌ | ❌ | create pr to add support <br><sub>no plan to support</sub> 

<sub>☑️ working, ⬛ no-status, ❌ not-supported</sub>

<br>

## 📄 LICENSE

```license
The MIT License (MIT)

Copyright (c) 2022 Sujaykumar.Hublikar <hello@sujaykumarh.com>
```

Read full license [here](https://github.com/sujaykumarh/dotfiles/blob/dev/LICENSE)

for [additional LICENSEs](https://github.com/sujaykumarh/dotfiles/blob/dev/additional-licenses.txt)


<br>



**📅 Changelog**

<!-- TODO: add -->
Read [CHANGELOG.md](#)
<!-- Read [CHANGELOG.md](CHANGELOG.md) -->

<br>
<br>

**😀 Inspiration**

Originally inspired by [parth/dotfiles](https://github.com/Parth/dotfiles) and other OpenSource github repos on [dotfiles ](https://github.com/topics/dotfiles)

<br>

<sub>

<div align="center">

**🔋 powered by**

<br>

[![](https://img.shields.io/badge/zsh-shell-blue.svg?style=flat-square)](https://en.wikipedia.org/wiki/Z_shell)  [![](https://img.shields.io/badge/oh--my--zsh-&%20plugins-blue.svg?style=flat-square)](https://ohmyz.sh/) [![](https://img.shields.io/badge/package-fzf-fe17a2.svg?style=flat-square)](https://github.com/junegunn/fzf) [![](https://img.shields.io/badge/gitmoji-😀-FFDD67.svg?style=flat-square)](https://gitmoji.dev)

<!-- [![](https://img.shields.io/badge/setup-nodejs-brightgreen.svg?style=flat-square)](https://nodejs.org) -->

</sub>

</div>