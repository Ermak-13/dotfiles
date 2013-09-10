export PYTHONIOENCODING=utf-8

export DOTFILES_PATH=$HOME/dotfiles
export DOTFILES_PYTHON_PATH=$DOTFILES_PATH/python
export PYTHONPATH=${PYTHONPATH}:$DOTFILES_PYTHON_PATH

export DOTFILES_SHELL_PATH=$DOTFILES_PATH/shell
export DOTFILES_TMUX_PATH=$DOTFILES_PATH/tmux

source $DOTFILES_SHELL_PATH/.django_bash_completion.sh

source $DOTFILES_SHELL_PATH/pip.sh
source $DOTFILES_SHELL_PATH/python.sh
source $DOTFILES_SHELL_PATH/reload.sh
source $DOTFILES_SHELL_PATH/svn.sh
source $DOTFILES_SHELL_PATH/tmux.sh


export _SVN_DIFF_PATH=$HOME/workspace/patches
export _SVN_DIFF_FILE_NAME="$(date +"%m%d%y%H%M%S").html"