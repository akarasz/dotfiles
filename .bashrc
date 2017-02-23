# vim:fdm=marker

[ -f /etc/bashrc ] && . /etc/bashrc
[ -f $HOME/.bash_functions ] && . $HOME/.bash_functions

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

[ -f $HOME/.local/bash_aliases ] && . $HOME/.local/bash_aliases

alias s='sudo $(history -p !!)'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'
alias reload='. ~/.bash_profile'

# password gen
alias genpass='echo $(< /dev/urandom tr -dc \._A-Z-a-z-0-9 | head -c32)'

# git aliases
alias g='git'

# maven aliases
alias mvnw='mvn wildfly:undeploy clean package wildfly:deploy'

alias mvnc='mvn clean'
alias mvncp='mvn clean package'
alias mvnci='mvn clean install'
alias mvncd='mvn clean deploy'

# psql aliases
alias psqlp='psql -U postgres'

# wildfly aliases
alias wfl='tail -n 100 -f /opt/wildfly/standalone/log/server.log'

# }}}
