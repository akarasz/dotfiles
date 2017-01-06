INSTALL
=======

```
alias config='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'

git clone --separate-git-dir=$HOME/.dotfiles-repo git@github.com:akarasz/dotfiles.git ~/dotfiles-tmp
config config status.showUntrackedFiles no

cp -rp ~/dotfiles-tmp/. ~/.
rm -r ~/dotfiles-tmp

config submodule update --init --recursive
```
