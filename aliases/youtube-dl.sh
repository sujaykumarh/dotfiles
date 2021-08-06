
# youtube-dl
#   url: https://youtube-dl.org/
#   source: https://github.com/ytdl-org/youtube-dl/

_ytdl(){
    if [[ `which youtube-dl` == "youtube-dl not found" ]]; then
        echo "youtube-dl was not found! Please install youtube-dl"
        return
    fi
    youtube-dl $@
}

_ytdlAudio() {
    if [ $# -eq 0 ];
    then
        echo -e "No urls provided.\n"
        echo -e "Usage: youtube-dl-audio [URLs]"	
    return 1;
    fi
    
    #echo "$@"
    _ytdl -f 140 "$@"
}

alias youtube-dl='_ytdl'
alias ytdl='_ytdl'
alias youtube-dl-audio='noglob _ytdlAudio' # fix for youtube-dl
alias ytdl-audio='youtube-dl-audio'
