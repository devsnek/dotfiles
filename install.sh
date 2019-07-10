#!/bin/bash

info() {
  echo "$@"
}

warn() {
  echo "$(tput setaf 1)$@$(tput sgr0)"
}

install() { 
  local src="$(pwd)/dotfiles/$1"
  local dst="${2:-$HOME}/$1"
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

warn "Symlinking files"

install .gitconfig
install .gitattributes

install config.fish "$HOME/.config/fish"
install htoprc "$HOME/.config/htop"

install init.vim "$HOME/.config/nvim"
install .vimrc
install base.vim

install .tmux.conf
install .eslintrc.js

warn "Installing misc deps"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

warn "Running misc commands"

$(which vim) +PlugUpdate +qall
if command -v neovim; then
  $(which neovim) +PlugUpdate +qall
fi
