# 📦 dotfiles

🧑‍💻 🗄️ personal dotfiles

[![LICENSE](https://img.shields.io/badge/license-Apache%202.0-blue?logo=github&color=brightgreen)](https://github.com/sujaykumarh/dotfiles/blob/main/LICENSE)


### Plugins

all plugins and its config go `modules` directory respective folder

plugin | available | tested | working | 
------ | --------- | ------ | ------- |
zsh     | ☑️ | ☑️ | ☑️ |
fzf     | ☑️ | ☑️ | ⬛ |
vim     | ☑️ | ⬛ | ⬛ |
tmux    | ☑️ | ⬛ | ⬛ |
<!-- tmux    | ☑️ | ⬛ | ⬛ | -->

<!-- ⬛ ☑️ ❌ -->

### Supported Systems

If you would like to add support / publish test results create issue or pr all contributions are welcome

OS | Supported | Tested
-- | --------- | --------
Ubuntu          | ☑️ | ☑️ |
ArchLinux       | ☑️ | ☑️ |
Other Linux     | ☑️ | ⬛ |
MacOS           | ⬛ | ❌ |
Windows         | ❌ | ❌ |


### Directory Structure

```
/                   root directory
|--/aliases/        dotfile aliases
|--/backup/         backupfiles created when ./install.sh is ran
|--/dot-scripts/    scripts required by dotfiles setup
|--/files/          template files
|--/modules/        all plugin modules zsh, tmux etc..
|--/scripts/        scripts used by aliases 
|
|-- default.env     dotfiles default env file 
|-- init.sh         dotfiles initilization script ran before install
|-- install.sh      dotfiles setup script
|-- remove.sh       dotfiles removal script #TODO
|-- menu.sh         dotfiles shell gui menu #TODO
|-- LICENSE         dotfiles license
|-- addi..ses.txt   additional licenses
|
|-- git.cfg         local global git config
|-- local.env       local env file
```

<br>

## 🛠️ Setup

setup dotfile directly

```
curl https://git.io/JBHRh | sh
```

or

```bash
curl https://raw.githubusercontent.com/sujaykumarh/dotfiles/main/setup.sh | sh
```

<br>

## 🛠️ Usage

**clone**

```bash
git clone https://github.com/sujaykumarh/dotfiles.git ~/dotfiles
```

**Config**

Initialize dotfiles local config files by running `sh init.sh`

```bash
cd ~/dotfiles && sh init.sh
```

**Menu**

configure dotfiles on system using interactive menu

```bash
# TODO

cd ~/dotfiles && sh menu.sh
```

**Install**

```bash
cd ~/dotfiles && sh install.sh
```

**Remove**

```
cd ~/dotfiles && sh remove.sh
```

<br>

## 🔧 Development


```bash
git clone https://github.com/sujaykumarh/dotfiles.git ~/dotfiles

# TODO
cd ~/dotfiles && sh docker.sh
```

<br>

## Contributing

Contributions are welcome, see [CONTRIBUTING](https://github.com/sujaykumarh/dotfiles/blob/main/.github/CONTRIBUTING.md).

<br>

## 📄 LICENSE


```
Copyright (c) 2021 Sujaykumar.Hublikar <hello@sujaykumarh.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

for [Full LICENSE](https://github.com/sujaykumarh/dotfiles/blob/main/LICENSE)

for [additional LICENSEs](https://github.com/sujaykumarh/dotfiles/blob/main/additional-licenses.txt)


<br>

## 📅 Changelog

Read [CHANGELOG.md](https://github.com/sujaykumarh/dotfiles/blob/main/CHANGELOG.md)

<br>

### 😀 Inspiration

Inspired by [Parth/dotfiles](https://github.com/Parth/dotfiles) and other OpenSource github repos on [dotfiles topic](https://github.com/topics/dotfiles)