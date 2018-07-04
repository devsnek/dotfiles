if &compatible
  set nocompatible
endif

let g:python_host_prog = $HOME . '/.pyenv/shims/python2'
let g:python3_host_prog = $HOME . '/.pyenv/shims/python3'

set runtimepath+=~/.config/nvim/rplugin

source ~/base.vim

call plug#begin('~/.local/share/nvim/plugged')

for plugin in BaseGetPlugins()
  Plug(plugin)
endfor

Plug 'neovim/node-host'
Plug 'mklabs/split-term.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

call BaseApplySettings()

set splitbelow splitright
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
