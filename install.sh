#!/bin/bash

. ./common.sh

warn "Symlinking files"

install .gitconfig
install .gitattributes

install i3.conf "$HOME/.config/i3/config"
install lock.sh "$HOME/.config/i3/lock.sh"

install polybar/config.ini "$HOME/.config/polybar/config.ini"
install polybar/powermenu.ini "$HOME/.config/polybar/powermenu.ini"
install polybar/start.sh "$HOME/.config/polybar/start.sh"

install config.fish "$HOME/.config/fish/config.fish"
install htoprc "$HOME/.config/htop/htoprc"
install dunstrc "$HOME/.config/dunst/dunstrc"

install vim/init.vim "$HOME/.config/nvim/init.vim"
install vim/.vimrc "$HOME/.vimrc"
install vim/base.vim "$HOME/base.vim"

install .eslintrc.js

install kitty.conf "$HOME/.config/kitty/kitty.conf"

if command -v bat; then
  install bat_config $(bat --config-file)
fi

warn "Installing misc deps"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

warn "Running misc commands"

$(which vim) +PlugUpdate +qall
if command -v nvim; then
  $(which nvim) +PlugUpdate +qall
fi
