set shell=/bin/bash
set nocompatible
filetype off
set directory^=$HOME/.vim/tmp//

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'wellle/targets.vim'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'dag/vim-fish'
Plugin 'mileszs/ack.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'posva/vim-vue'
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on

let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_solarized_normal_green = 1
let g:javascript_plugin_jsdoc = 1

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

syntax enable
set background=dark
colorscheme solarized

set whichwrap+=<,>,h,l,[,]
set nu

set mouse=a

filetype indent off
" set cindent
set smartindent
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

