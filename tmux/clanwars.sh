tmux new-session -s clanwars -n editor -d

tmux send-keys -t clanwars 'cd' C-m
tmux send-keys -t clanwars 'workon wgcw' C-m
tmux send-keys -t clanwars 'clear' C-m
tmux split-window -h -t clanwars

tmux send-keys -t clanwars 'cd' C-m
tmux send-keys -t clanwars 'workon wgcw' C-m
tmux send-keys -t clanwars 'clear' C-m
tmux send-keys -t clanwars 'wgcwserver' C-m
tmux split-window -v -p 20 -t clanwars

tmux send-keys -t clanwars 'cd' C-m
tmux send-keys -t clanwars 'workon portal' C-m
tmux send-keys -t clanwars 'clear' C-m
tmux send-keys -t clanwars 'portalserver' C-m

tmux attach -t clanwars
