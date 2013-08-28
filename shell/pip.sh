function _pip() {
    case $1 in
        install) _pip_install;;
    esac
}

function _pip_install() {
    pip install -U -r $_PIP_PACKAGES_DIR --find-links=$_PIP_PACKAGES_URL --index-url=$_PIP_PACKAGES_URL
    echo '_pip install: the packages is installed.'
}
