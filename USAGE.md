# Usage

> Available commands and usage

## ⌨️ Keyboard Shortcuts

```
ct --> control key
sw --> shift key
al --> alt key
cm --> command / windows key
```

command     | description
----------- | -------------------------------
ct + g      | git commit and push
ct + r      | reset & clear
ct + h      | goto home
ct + v      | edit previous command and run
ct + l      | list files, `ls` command
ct + s      | add `sudo` to command
ct + k      | goto previous directory, `cd ..`

<br>

## ⏩ ZSH Aliases

terminal aliases

#### Folder operations

command     | description
----------- | -----------------------------------
..          | cd to previous folder
...         | cd to previous previous folder so on..
.......     | will switch to previous folders on number of dots
./folder    | cd to folder in current folder
../folder   | cd to folder in previous folder
cd          | cd into folder and list files by default
l           | list
ls          | list
ll          | list with details
llh         | list with details in human file size
la          | list all including . files/folders with details
lah         | list all including . files/folders with details in human file size

#### Docker aliases

command         | description
--------------- | -----------------------------------
--------------- | **docker**
dk              | `docker`
dkr             | `docker run`
dkrm            | `docker run --rm`
dkrmit          | `docker run --rm -it`
dkps            | `docker ps` with custom formatting
dkps-default    | default `docker ps`
dkpsl           | dkps with all 
dks             | `docker service`
dkl             | `docker logs`
dklf            | `docker logs -f`
dkrm            | `docker rm`
dkexe           | `docker exec -it`
--------------- | **docker machine**
dm              | `docker machine`
--------------- | **docker compose**
dcr             | `docker-compose`
dcrun           | `docker-compose run`
dcrunrm         | `docker-compose run --rm`
dcrbuild        | `docker-compose build`
dcrbuildrun     | `docker-compose  up -d --build` docker compose build run in detach mode


#### **Project Folder** operations

command         | description
--------------- | -----------------------------------
mk-dc-env       | init current dir for docker project  #TODO
mk-gitignore    | add default .gitignore file
mk-gitkeep      | add empty .gitkeep file
init-repo       | removes .git folder and inits new .git project
mk-project-gh-action | clones github actions project from [template](https://github.com/sujaykumarh/gh-action-js-template)

#### Misc operations

command         | description
--------------- | -----------------------------------
speedtest       | runs `speedtest.net` python script
transfer.sh     | runs `transfer.sh` command to push to `transfer.sh`
ytdl            | short for `youtube-dl`
ytdl-audio      | short for `youtube-dl -f 140`
whatsmyip       | print local / external ip and system hostname. use `whatsmyip --help` to learn more
docker-cleanup  | run docker-cleanup script
