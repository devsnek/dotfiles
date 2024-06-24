set shell=/bin/bash
set nocompatible
filetype off
set directory^=$HOME/.vim/tmp//


call plug#begin('~/.vim/plugged')
source ~/base.vim
call plug#end()

call BaseApplySettings()

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif
