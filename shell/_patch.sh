_patch() {
    current_date=`date +"%m%d%y"`
    current_time=`date +"%T"`
    if [ ! -d $_PATCH_PATH/$current_date ]; then mkdir $_PATCH_PATH/$current_date; fi
    if [ $# = 0 ]; 
      then name=$current_time 
    else 
      name=$1 
    fi
    path=$_PATCH_PATH/$current_date/$name.html
    echo $path
    svn diff --git --no-diff-deleted -x -p | pygmentize -l diff -f html -O full,style=emacs > $path
    chromium-browser $path &
}
