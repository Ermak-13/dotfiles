function _reload() {
	case $1 in
		bashrc) _reload_bashrc;;
		profile) _reload_profile;;
	esac
}

function _reload_bashrc() {
    source $HOME/.bashrc
    echo '_reload bashrc: ~/.bashrc was reloaded.'
}

function _reload_profile() {
	source $HOME/.profile
	echo '_reload profile: ~/.profile was reloaded.'
}
