clean() {
    find . -type f -name "*.py[co]" -delete
}

_python() {
    case $1 in
        clean)
            clean
        ;;
    esac
}
