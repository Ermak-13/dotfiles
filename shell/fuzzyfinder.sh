export FUZZYFINDER_DEFAULT_PARENTDIR=$HOME/workspace

function fuzzyfinder() {
    if [ $# != 1 ]; then
        echo 'pass one argument!'
    else
        result=$(python $DOTFILES_PYTHON_PATH/fuzzyfinder/command.py $1 -p)
        cd $result
    fi
}

alias _ff='fuzzyfinder'
