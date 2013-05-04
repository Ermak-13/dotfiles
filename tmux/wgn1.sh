tmux new-session -s wgn1 -n editor -d
tmux send-keys -t wgn1 'cd ~/workspace/full_web' C-m
tmux split-window -h -t wgn1

tmux send-keys -t wgn1 'cd ~/workspace/full_web/wgnp/trunk' C-m
tmux send-keys -t wgn1 'python manage.py runserver' C-m
tmux split-window -v -t wgn1

tmux send-keys -t wgn1 'cd ~/workspace/full_web/wgnp/trunk' C-m
tmux send-keys -t wgn1 'python manage.py authentication_openid_worker' C-m
tmux split-window -v -t wgn1 # wgnp worker

# cannot create panel if too small (this repair problem)
tmux select-layout -t wgn1 main-vertical

tmux send-keys -t wgn1 'cd ~/workspace/full_web/wgni/trunk' C-m
tmux send-keys -t wgn1 'python manage.py runserver 127.0.0.1:8001' C-m
tmux split-window -v -t wgn1

tmux send-keys -t wgn1 'cd ~/workspace/full_web/wgni/trunk' C-m
tmux send-keys -t wgn1 'python manage.py authentication_basic_worker' C-m
tmux split-window -v -t wgn1

# cannot create panel if too small (this repair problem)
tmux select-layout -t wgn1 main-vertical

tmux send-keys -t wgn1 'cd ~/workspace/full_web/wgnr/trunk' C-m
tmux send-keys -t wgn1 'python manage.py runserver 127.0.0.1:8002' C-m
tmux split-window -v -t wgn1

tmux send-keys -t wgn1 'cd ~/workspace/full_web/wgnr/trunk' C-m
tmux send-keys -t wgn1 'python manage.py registration_basic_worker' C-m

tmux select-layout -t wgn1 main-vertical
tmux attach -t wgn1
