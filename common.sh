#!/bin/bash

info() {
  echo "$@"
}

warn() {
  echo "$(tput setaf 1)$@$(tput sgr0)"
}

install() {
  local src="$(pwd)/dotfiles/$1"
  local dst=${2:-"$HOME/$1"}
  info "linking $src to $dst"
  ln -sf $src $dst
}

gitstall() {
  if [ -d "$2" ]; then
    rm -rf "$2"
  fi
  git clone "$1" "$2"
  info "cloning $1 to $2"
}
