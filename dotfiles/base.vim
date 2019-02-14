set nocompatible

function BaseGetPlugins()
  return [
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
\   'editorconfig/editorconfig-vim',
\   'wakatime/vim-wakatime',
\   'tomlion/vim-solidity',
\   'kelan/gyp.vim',
\   'leafgarland/typescript-vim',
\   'wincent/terminus',
\   'cespare/vim-toml',
\   'octol/vim-cpp-enhanced-highlight',
\   'vim-scripts/bnf.vim',
\   'rhysd/vim-rustpeg',
\   'vhda/verilog_systemverilog.vim',
\   '/Users/gus/Desktop/projects/vim-wasm',
\   '/Users/gus/Desktop/v8/tools/torque/vim-torque',
\ ]
endfunction

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set guicursor=                  "Use nice cursor
set whichwrap+=<,>,h,l,[,]      "remap movement keys
set mouse=a                     "Enable better mouse support
set nu
set guicursor=

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"move yanks to system clipboard
if has('clipboard')
  set clipboard=unnamed
end

"refer to kspell for spelling
set complete+=kspell

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*DS_Store*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital


function BaseApplySettings()

  set background=dark
  syntax on

  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'term'
  let g:airline#extensions#ale#enabled = 1
  let g:javascript_plugin_jsdoc = 1

  let g:vim_markdown_conceal = 0
  let g:vim_markdown_folding_disabled = 1
  set conceallevel=2
  let g:vim_markdown_fenced_languages = ['py=python', 'js=javascript']

  let g:ale_fixers = {
  \   'javascript': ['eslint'],
  \}
  let g:ale_javascript_eslint_use_global = 1

  let g:deoplete#enable_at_startup = 1

  nnoremap <silent> <C-l> :nohl<CR><C-l>

  autocmd BufNewFile,BufRead *.bs   set syntax=html
  autocmd BufNewFile,BufRead *.sl   set syntax=javascript

  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endfunction
