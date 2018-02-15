function BaseGetPlugins()
  return [
\   'altercation/vim-colors-solarized',
\   'sickill/vim-monokai',
\   'vim-airline/vim-airline',
\   'vim-airline/vim-airline-themes',
\   'w0rp/ale',
\   'pangloss/vim-javascript',
\   'moll/vim-node',
\   'elzr/vim-json',
\   'tpope/vim-fugitive',
\   'plasticboy/vim-markdown',
\   'godlygeek/tabular',
\   'wellle/targets.vim',
\   'tpope/vim-commentary',
\   'scrooloose/nerdtree',
\   'dag/vim-fish',
\   'mileszs/ack.vim',
\   'mustache/vim-mustache-handlebars',
\   'posva/vim-vue',
\   'editorconfig/editorconfig-vim',
\   'wakatime/vim-wakatime',
\   'tomlion/vim-solidity',
\   'peterhoeg/vim-qml',
\   'kelan/gyp.vim',
\   'leafgarland/typescript-vim',
\   'lluchs/vim-wren',
\   'terryma/vim-multiple-cursors',
\   'wincent/terminus',
\   'cespare/vim-toml'
\ ]
endfunction

function BaseApplySettings()
  filetype plugin indent on
  syntax enable

  set guicursor=

  set background=dark
  colorscheme solarized

  set whichwrap+=<,>,h,l,[,]
  set nu
  set mouse=a
  set smartindent
  set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
  set nowrap

  let g:airline_powerline_fonts = 1
  let g:airline#extensions#ale#enabled = 1
  let g:airline_solarized_normal_green = 1
  let g:javascript_plugin_jsdoc = 1

  let g:vim_markdown_folding_disabled = 1
  set conceallevel=2
  let g:markdown_github_languages = ['python', 'py=python', 'json', 'html', 'javascript=js']

  let g:ale_fixers = {
  \   'javascript': ['eslint'],
  \}

  command Wq wq

  autocmd vimenter * NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endfunction
