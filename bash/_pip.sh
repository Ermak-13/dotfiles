_pip_install() {
    pip install -U -r .meta/packages --find-links=http://pypi.worldoftanks.com --index-url=http://pypi.worldoftanks.com
}

_pip() {
    case $1 in
        install)
            _pip_install
        ;;
    esac
}
