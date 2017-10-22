set shell=/bin/bash
set nocompatible
filetype off
set directory^=$HOME/.vim/tmp//

source ~/base.vim

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

for plugin in BaseGetPlugins()
  Plugin plugin
endfor

call vundle#end()
filetype plugin indent on

call BaseApplySettings()
