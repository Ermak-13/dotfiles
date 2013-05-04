DOTFILES_PATH=$HOME/dotfiles
BOOTSTRAP_LOCK=$DOTFILES_PATH/bootstrap.lock

require() {
	for i in $@; do
		if [[ -z `which $i` ]] ;then
			echo "You should install $i!"
			exit
		fi
	done
}

if [ ! -e $BOOTSTRAP_LOCK ] ; then
    touch $BOOTSTRAP_LOCK
fi
source $BOOTSTRAP_LOCK

if ! ${DOTFILES_SHELL_INSTALLED:=false} ;then
	echo "source $DOTFILES_PATH/shell/.bashrc" >> $HOME/.bashrc
	echo "DOTFILES_BASHRC_INSTALLED=true" >> $BOOTSTRAP_LOCK
fi

if ! ${DOTFILES_TMUX_INSTALLED:=false} ;then
	require tmux
	ln -s $DOTFILES_PATH/tmux/.tmux.conf $HOME/.tmux.conf
	echo "DOTFILES_TMUX_CONF=true" >> $BOOTSTRAP_LOCK
fi
