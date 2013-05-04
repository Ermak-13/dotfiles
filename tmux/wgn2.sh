tmux new-session -s wgn2 -n editor -d
tmux send-keys -t wgn2 'cd ~/workspace/full_web2' C-m
tmux split-window -h -t wgn2

tmux send-keys -t wgn2 'cd ~/workspace/full_web2/wgnp/trunk' C-m
tmux send-keys -t wgn2 'python manage.py runserver' C-m
tmux split-window -v -t wgn2

tmux send-keys -t wgn2 'cd ~/workspace/full_web2/wgnp/trunk' C-m
tmux send-keys -t wgn2 'python manage.py authentication_openid_worker' C-m
tmux split-window -v -t wgn2 # wgnp worker

# cannot create panel if too small (this repair problem)
tmux select-layout -t wgn2 main-vertical

tmux send-keys -t wgn2 'cd ~/workspace/full_web2/wgni/trunk' C-m
tmux send-keys -t wgn2 'python manage.py runserver 127.0.0.1:8001' C-m
tmux split-window -v -t wgn2

tmux send-keys -t wgn2 'cd ~/workspace/full_web2/wgni/trunk' C-m
tmux send-keys -t wgn2 'python manage.py authentication_basic_worker' C-m
tmux split-window -v -t wgn2

# cannot create panel if too small (this repair problem)
tmux select-layout -t wgn2 main-vertical

tmux send-keys -t wgn2 'cd ~/workspace/full_web2/wgnr/trunk' C-m
tmux send-keys -t wgn2 'python manage.py runserver 127.0.0.1:8002' C-m
tmux split-window -v -t wgn2

tmux send-keys -t wgn2 'cd ~/workspace/full_web2/wgnr/trunk' C-m
tmux send-keys -t wgn2 'python manage.py registration_basic_worker' C-m

tmux select-layout -t wgn2 main-vertical
tmux attach -t wgn2
