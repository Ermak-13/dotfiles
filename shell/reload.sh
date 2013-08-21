function _reload() {
	case $1 in
		bashrc) _reload_bashrc;;
		profile) _reload_profile;;
	esac
}

function _reload_bashrc() {
    echo 'reload ~/.bashrc!'
    source $HOME/.bashrc
}

function _reload_profile() {
	echo 'reload ~/.profile'
	source $HOME/.profile
}
