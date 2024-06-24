if &compatible
  set nocompatible
endif

let g:python_host_prog = '/usr/bin/pypy'
let g:python3_host_prog = '/usr/bin/pypy3'

set runtimepath+=~/.config/nvim/rplugin


call plug#begin('~/.local/share/nvim/plugged')
source ~/base.vim
call plug#end()

call BaseApplySettings()

let g:deoplete#enable_at_startup = 1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set splitbelow splitright
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
