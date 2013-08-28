export DOTFILES_PATH=$HOME/dotfiles

export DOTFILES_PYTHON_PATH=$DOTFILES_PATH/python
export PYTHONPATH=${PYTHONPATH}:$DOTFILES_PYTHON_PATH

export DOTFILES_SHELL_PATH=$DOTFILES_PATH/shell
export DOTFILES_TMUX_PATH=$DOTFILES_PATH/tmux

source $DOTFILES_SHELL_PATH/settings.sh
source $DOTFILES_SHELL_PATH/.django_bash_completion.sh

source $DOTFILES_SHELL_PATH/pip.sh
source $DOTFILES_SHELL_PATH/python.sh
source $DOTFILES_SHELL_PATH/reload.sh
source $DOTFILES_SHELL_PATH/svn.sh
source $DOTFILES_SHELL_PATH/tmux.sh

_PATCH_PATH=$HOME/workspace/patches
_patch() {
    current_date=`date +"%m%d%y"`
    current_time=`date +"%T"`
    if [ ! -d $_PATCH_PATH/$current_date ]; then mkdir $_PATCH_PATH/$current_date; fi
    if [ $# = 0 ]; 
      then name=$current_time 
    else 
      name=$1 
    fi
    path=$_PATCH_PATH/$current_date/$name.html
    echo $path
    svn diff --git --no-diff-deleted -x -p | pygmentize -l diff -f html -O full,style=emacs > $path
    chromium-browser $path &
}

_svn_remove_unversioned_files() {
    svn status | grep '^?' | awk '{print $2}' | xargs rm -rf
}

_pip_install() {
    pip install -U -r .meta/packages --find-links=http://pypi.worldoftanks.com --index-url=http://pypi.worldoftanks.com
}
