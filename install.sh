#!/bin/bash

info() {
  echo "$@"
}

warn() {
  echo "$(tput setaf 1)$@$(tput sgr0)"
}

install() { 
  local src="$(pwd)/$1"
  local dst="${2:-$HOME}/$1"
  info "linking $src to $dst"
  if [ -f "$dst" ]; then
    rm $dst
  fi
  ln -s $src $dst
}

gitstall() {
  if [ -d "$2" ]; then
    rm -rf "$2"
  fi
  git clone "$1" "$2"
  info "cloning $1 to $2"
}

warn "Symlinking files"

install config.fish "$HOME/.config/fish"

install init.vim "$HOME/.config/nvim"
install .vimrc
install base.vim

install .tmux.conf
install .eslintrc.json

warn "Installing misc deps"

gitstall https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
gitstall https://github.com/Shougo/dein.vim "$HOME/.config/nvim/plugins/repos/github.com/Shougo/dein.vim"

warn "Running misc commands"

$(which vim) +PluginInstall +qall
