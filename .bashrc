# global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'
