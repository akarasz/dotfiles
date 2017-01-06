# vim:fdm=marker

[ -f /etc/bashrc ] && . /etc/bashrc

# ssh-agent {{{

if [ -f ~/.ssh/id_rsa ]; then
    if [ ! -S ~/.ssh/ssh_auth_sock ]; then
        eval $(ssh-agent)
        ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
    fi

    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
    ssh-add -l > /dev/null || ssh-add
fi

# }}}
# aliases {{{

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'

# }}}
