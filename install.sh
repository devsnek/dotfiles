#!/bin/bash

rdir() {
  echo $(cd $1; pwd)
}

home=$(rdir ~/)
here=$(rdir .)

install() { 
  local src="$here/$1"
  local dst="${3:-$home}/$1"
  echo "linking $src to $dst"
  rm $dst
  ln -s $src $dst
}

install config.fish false $(rdir ~/.config/fish)
install .tmux.conf
install .eslintrc.json
install .vimrc
