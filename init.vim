if &compatible
  set nocompatible
endif

set runtimepath+=~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.config/nvim/rplugin

source ~/base.vim

if dein#load_state('~/.config/nvim/plugins')
  call dein#begin('~/.config/nvim/plugins')
  call dein#add('~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim')

  for plugin in BaseGetPlugins()
    call dein#add(plugin)
  endfor

  call dein#add('neovim/node-host')
  call dein#add('mklabs/split-term.vim')
  call dein#add('aurieh/discord.nvim')

  call dein#end()
  call dein#save_state()
endif

call BaseApplySettings()

set splitbelow splitright
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

if dein#check_install()
  call dein#install()
endif
