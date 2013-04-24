_svn_remove_unversioned_files() {
    svn status | grep '^?' | awk '{print $2}' | xargs rm -rf
}

_svn() {
    case $1 in
        remove_unversioned_files)
            _svn_remove_unversioned_files
        ;;
    esac
}
