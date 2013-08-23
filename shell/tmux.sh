function _tmux() {
    case $1 in
        activate) _tmux_activate $2;;
        *) _tmux_activate $1;;
    esac
}

function _tmux_activate() {
    source $HOME/dotfiles/tmux/$1.sh
}
