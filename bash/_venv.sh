_venv() {
    source $_VENV_PATH/$1/bin/activate
}

function _venv_detect {
    current_dir=$(pwd)
    while [ $current_dir != '/' ]; do
        result=($(find $current_dir -maxdepth 1 -type f -name '.venvrc'))
        if [[ ${#result[@]} > 0 ]]; then
            result=${result[0]}
            source $result
            break
        fi
        current_dir=$(dirname $current_dir)
    done
}

function cd {
    builtin cd "$@" && _venv_detect
}
