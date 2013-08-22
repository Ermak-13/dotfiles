function _python() {
	case $1 in
		clean) _python_clean;;
	esac
}

function _python_clean() {
	find . -type f -name "*.py[co]" -delete
	echo '_python clean: *.py[co] files was removed.'
}