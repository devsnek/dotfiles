#!/bin/bash

rdir() {
  echo $(cd $1; pwd)
}

home=$(rdir ~/)
here=$(rdir .)

install() {
  local dname=$1
  if [ "$2" != false ]; then local dname=".$dname"; fi
  local src="$here/$1"
  local dst="${3:-$home}/$dname"
  echo "linking $src to $dst"
  ln -s $src $dst
}

install config.fish false $(rdir ~/.config/fish)
install tmux.conf
install eslintrc.json
install vimrc
