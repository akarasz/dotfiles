# vim:fdm=marker

[ -f ~/.profile ] && . ~/.profile

FUNCTIONS_DIR=~/functions
for file in $FUNCTIONS_DIR/*; do
    . $file
done

[ -f ~/.bashrc ] && . ~/.bashrc
