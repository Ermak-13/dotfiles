install() {
    pip install -U -r .meta/packages --find-links=http://pypi.worldoftanks.com --index-url=http://pypi.worldoftanks.com
}

_pip() {
    case $1 in
        install)
            install
        ;;
    esac
}
