if &compatible
  set nocompatible
endif

set runtimepath+=~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/plugins')
  call dein#begin('~/.config/nvim/plugins')
  call dein#add('~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim')

  call dein#add('altercation/vim-colors-solarized')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('w0rp/ale')
  call dein#add('pangloss/vim-javascript')
  call dein#add('moll/vim-node')
  call dein#add('elzr/vim-json')
  call dein#add('tpope/vim-fugitive')
  call dein#add('godlygeek/tabular')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('wellle/targets.vim')
  call dein#add('tpope/vim-commentary')
  call dein#add('scrooloose/nerdtree')
  call dein#add('dag/vim-fish')
  call dein#add('mileszs/ack.vim')
  call dein#add('mustache/vim-mustache-handlebars')
  call dein#add('posva/vim-vue')
  call dein#add('editorconfig/editorconfig-vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

set background=dark
colorscheme solarized

set whichwrap+=<,>,h,l,[,]
set nu
set mouse=a
set smartindent
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

if dein#check_install()
  call dein#install()
endif

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
