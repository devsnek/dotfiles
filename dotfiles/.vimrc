set shell=/bin/bash
set nocompatible
filetype off
set directory^=$HOME/.vim/tmp//

source ~/base.vim

call plug#begin('~/.vim/plugged')
for plugin in BaseGetPlugins()
  Plug plugin

  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endfor
call plug#end()

call BaseApplySettings()

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif
