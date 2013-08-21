function _svn() {
	case $1 in
		garbage) _svn_remove_garbage;;
	esac
}

function _svn_remove_garbage() {
	svn status | grep '^?' | awk '{print $2}' | xargs rm -rf
	echo '_svn garbage: garbage was removed.'
}