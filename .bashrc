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
# ssh session handler

#[ -f $HOME/.ssh/sessions/manage.sh ] && $HOME/.ssh/sessions/manage.sh &

# }}}
# start tmux {{{

if [ -z $TMUX ]; then  # is tmux running
    if command -v tmux &>/dev/null; then  # is tmux installed
        if tmux a; then  # try to reattach
            :
        else  # start new
            tmux
        fi
    fi
fi

# }}}
