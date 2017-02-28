#!/bin/bash

function axl() {
    local host="$1"
    local username="$2"
    local password="$3"
    local xml="$4"

    curl -X POST --header "content-type: text/xml" --insecure --user $username:$password --data @$xml https://$host:8443/axl/
    echo  # to append a newline
}

function alias-add() {
    local name="$1"
    local command="${@:2}"

    local LOCAL_ALIASES=$HOME/.local/bash_aliases

    local line="alias $name='$command'"

    echo "$line" >> $LOCAL_ALIASES  # persist
    . $LOCAL_ALIASES
}

alias sctls='sudo systemctl status'
alias sctlr='sudo systemctl restart'

function sctlon() {
    local service="$1"

    sudo systemctl start $service
    sudo systemctl enable $service
}

function sctloff() {
    local service="$1"

    sudo systemctl stop $service
    sudo systemctl disable $service
}

function colors-available() {
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
}

[ -f $HOME/.local/bash_functions ] && . $HOME/.local/bash_functions
