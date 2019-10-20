
## rename tmux window taken after the last command on fish.
#function window_rename --on-event fish_preexec
#    if test -n (echo $TERM | grep -e screen -e tmux)
#      tmux rename-window (printf "%.16s" $argv[1])
#    end
#end
