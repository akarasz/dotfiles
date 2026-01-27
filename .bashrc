#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

source /usr/share/nvm/init-nvm.sh
source /usr/share/git/completion/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"
PS1='\[\e[1m\]\u@\h\[\e(B\e[m\] \W\[\033[0;37m\]$(__git_ps1)\[\033[0m\] \[\e[1m\]\$\[\e(B\e[m\] '
alias dotfiles='/usr/bin/git --git-dir=/home/andris/.git-dotfiles/ --work-tree=/home/andris'
