set nocompatible

function BaseGetPlugins()
  return [
\   'chriskempson/base16-vim',
\   'vim-airline/vim-airline',
\   'vim-airline/vim-airline-themes',
\   'w0rp/ale',
\   'sheerun/vim-polyglot',
\   'plasticboy/vim-markdown',
\   'wakatime/vim-wakatime',
\   'editorconfig/editorconfig-vim',
\   '/home/snek/Desktop/projects/vim-wasm',
\   '/home/snek/Desktop/misc/v8/v8/tools/torque/vim-torque',
\   '/home/snek/Desktop/projects/unnamed_lang/vim'
\ ]
endfunction

set number                       "Line numbers are good
set history=1000                 "Store lots of :cmdline history
set showcmd                      "Show incomplete cmds down the bottom
set visualbell                   "No sounds
set autoread                     "Reload files changed outside vim
set guicursor=n-v-c:block-Cursor "Use block cursor in normal/visual/selection
set guicursor+=i:ver100-iCursor  "Use bar cursor in insert

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"move yanks to system clipboard
if has('clipboard')
  set clipboard=unnamedplus
end

"refer to kspell for spelling
set complete+=kspell

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
set nofoldenable "dont fold by default

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

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell
nnoremap <silent> <C-l> :nohl<CR><C-l>

let g:polyglot_disabled = ['md', 'markdown', 'jsx']

" settings to be applied after plugins load
function BaseApplySettings()
  set termguicolors
  set background=dark
  colors base16-default-dark

  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'term'
  let g:airline#extensions#ale#enabled = 1

  let g:ale_completion_enabled = 0
  let g:ale_linters = {
\   'javascript': ['eslint', 'prettier'],
\ }
  let g:ale_javascript_eslint_use_global = 1

  let g:vim_markdown_fenced_languages = ['py=python', 'js=javascript']

  autocmd BufNewFile,BufRead *.bs   set syntax=html
  autocmd BufNewFile,BufRead *.sl   set syntax=slither
  autocmd BufNewFile,BufRead *.inc  set syntax=c
  autocmd BufNewFile,BufRead *.mjs  set filetype=javascript

  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endfunction
