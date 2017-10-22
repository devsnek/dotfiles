if &compatible
  set nocompatible
endif

set runtimepath+=~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim

source ~/base.vim

if dein#load_state('~/.config/nvim/plugins')
  call dein#begin('~/.config/nvim/plugins')
  call dein#add('~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim')

  for plugin in BaseGetPlugins()
    call dein#add(plugin)
  endfor

  call dein#add('neovim/node-host')

  call dein#end()
  call dein#save_state()
endif

call BaseApplySettings()
