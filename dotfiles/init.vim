if &compatible
  set nocompatible
endif

let g:python_host_prog = '/usr/bin/pypy'
let g:python3_host_prog = '/usr/bin/pypy3'

set runtimepath+=~/.config/nvim/rplugin

source ~/base.vim

call plug#begin('~/.local/share/nvim/plugged')
for plugin in BaseGetPlugins()
  Plug(plugin)
endfor
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

call BaseApplySettings()

let g:deoplete#enable_at_startup = 1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set splitbelow splitright
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
