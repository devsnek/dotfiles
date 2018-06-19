if &compatible
  set nocompatible
endif

set runtimepath+=~/.config/nvim/rplugin

source ~/base.vim

call plug#begin('~/.local/share/nvim/plugged')

for plugin in BaseGetPlugins()
  Plug(plugin)
endfor

Plug 'neovim/node-host'
Plug 'mklabs/split-term.vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

call BaseApplySettings()

set splitbelow splitright
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'python': ['pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
