
# youtube-dl
#   url: https://youtube-dl.org/
#   source: https://github.com/ytdl-org/youtube-dl/

# return if youtube-dl is not installed
if [[ `which youtube-dl` == "youtube-dl not found" ]]; then
    return
fi

_ytdlAudio() {
    if [ $# -eq 0 ];
    then
        echo -e "No urls provided.\n"
        echo -e "Usage: youtube-dl-audio [URLs]"	
    return 1;
    fi
    
    #echo "$@"
    youtube-dl -f 140 "$@"
}

alias youtube-dl='noglob youtube-dl'
alias youtube-dl-audio='noglob _ytdlAudio' # fix for youtube-dl

alias ytdl='noglob youtube-dl'
alias ytdl-audio='noglob _ytdlAudio'
