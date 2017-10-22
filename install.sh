#!/bin/bash

install() { 
  local src="$(pwd)/$1"
  local dst="${2:-$HOME}/$1"
  echo "linking $src to $dst"
  rm $dst
  ln -s $src $dst
}

install config.fish "$HOME/.config/fish"
install init.vim "$HOME/.config/nvim"
install .tmux.conf
install .eslintrc.json
install .vimrc
