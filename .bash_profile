# vim:fdm=marker

[ -f ~/.profile ] && . ~/.profile

FUNCTIONS_DIR=~/functions
if [ -d $FUNCTIONS_DIR ]; then
    for file in $FUNCTIONS_DIR/*; do
        . $file
    done
fi

[ -f ~/.bashrc ] && . ~/.bashrc
