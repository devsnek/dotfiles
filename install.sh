#!/bin/bash

home=$(realpath ~)

install() { 
  local src="$(pwd)/$1"
  local dst="${3:-$home}/$1"
  echo "linking $src to $dst"
  rm $dst
  ln -s $src $dst
}

install config.fish false $(realpath ~/.config/fish)
install .tmux.conf
install .eslintrc.json
install .vimrc
