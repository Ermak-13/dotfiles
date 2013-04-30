source ~/dotfiles/shell/.django_bash_completion.sh

export PYTHONPATH=${PYTHONPATH}:$HOME/dotfiles/python
export PYTHONIOENCODING=utf-8


_VENV_PATH=$HOME/workspace/venv
_venv() {
    source $_VENV_PATH/$1/bin/activate
}

function _venv_detect {
    current_dir=$(pwd)
    while [ $current_dir != '/' ]; do
        result=($(find $current_dir -maxdepth 1 -type f -name '.venvrc'))
        if [[ ${#result[@]} > 0 ]]; then
            _VENV_ACTIVATED=true
            result=${result[0]}

            source $result
            break
        else
            if $_VENV_ACTIVATED; then
                _VENV_ACTIVATED=false
                deactivate
            fi
        fi
        current_dir=$(dirname $current_dir)
    done
}

function cd {
    builtin cd "$@" && _venv_detect
}

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

_python_clean() {
    find . -type f -name "*.py[co]" -delete
}
