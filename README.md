# dotfiles

📦 personal dotfiles

<br>

[![GitHub](https://img.shields.io/github/license/sujaykumarh/dotfiles)](https://github.com/sujaykumarh/dotfiles/blob/main/LICENSE)

<br>

## 🛠️ Usage

**clone**

```bash
git clone https://github.com/sujaykumarh/dotfiles.git ~/dotfiles
```

**Config**

`config.local` contains local configs, do-not edit config.cfg copy it to `config.local` file, if `config.local` is available `config.cfg` is not used

```bash
cd ~/dotfiles

cp config.cfg config.local

nano config.local
```

**Install**

```bash
cd ~/dotfiles

sh setup.sh
```

**Remove**

```
cd ~/dotfiles

sh uninstall.sh
```

<br>

## 🔧 Development


<br>

## 📄 LICENSE

Read full [LICENSE](https://github.com/sujaykumarh/dotfiles/blob/main/LICENSE)

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