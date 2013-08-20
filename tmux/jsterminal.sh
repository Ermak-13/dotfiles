tmux new-session -s jsterminal -n editor -d

tmux send-keys -t jsterminal 'cd ~/workspace/jsterminal' C-m
tmux send-keys -t jsterminal 'python -m SimpleHTTPServer 3000' C-m

tmux split-window -h -t jsterminal
tmux send-keys -t jsterminal 'cd ~/workspace/jsterminal' C-m

tmux attach -t jsterminal
