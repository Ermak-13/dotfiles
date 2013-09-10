function _svn() {
	case $1 in
        diff) _svn_diff $2;;
		garbage) _svn_remove_garbage;;
	esac
}

function _svn_diff() {
    diff=$_SVN_DIFF_PATH/$_SVN_DIFF_FILE_NAME
    svn diff --git --no-diff-deleted -x -p | pygmentize -l diff -f html -O full,style=emacs > $diff
    echo "_svn diff: $diff is created."

    case $1 in
        '--open') 
chromium-browser $diff
echo "_svn diff: $diff is opened."
;;
    esac
}

function _svn_remove_garbage() {
	svn status | grep '^?' | awk '{print $2}' | xargs rm -rf
	echo '_svn garbage: garbage was removed.'
}
