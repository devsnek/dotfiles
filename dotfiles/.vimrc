vim9script

set shell=/bin/bash
set nocompatible
filetype off
set directory^=$HOME/.vim/tmp//

call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'rhysd/vim-lsp-ale'
Plug '/home/snek/code/v8/v8/tools/torque/vim-torque'

call plug#end()

set number                       # Line numbers are good
set history=1000                 # Store lots of :cmdline history
set showcmd                      # Show incomplete cmds down the bottom
set visualbell                   # No sounds
set autoread                     # Reload files changed outside vim

set guicursor=n-v-c:block-Cursor # Use block cursor in normal/visual/selection
set guicursor+=i:ver100-iCursor  # Use bar cursor in insert
&t_SI = "\<Esc>[6 q"
&t_SR = "\<Esc>[4 q"
&t_EI = "\<Esc>[2 q"

# This makes vim act like all other editors, buffers can
# exist in the background without being in a window.
# http://items.sjbach.com/319/configuring-vim-right
set hidden

# move yanks to system clipboard
if has('clipboard')
  set clipboard=unnamedplus
endif

set completeopt=

# refer to kspell for spelling
set complete+=kspell

# ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

# ================ Persistent Undo ==================

# Keep undo history across sessions, by storing in file.
# Only works all the time.
if has('persistent_undo') && isdirectory(expand('~') .. '/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

# ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

# Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       # Don't wrap lines
set nofoldenable # dont fold by default

# ================ Completion =======================

set wildmode=list:longest
set wildmenu                  # enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~   # stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*DS_Store*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

# ================ Scrolling ========================

set scrolloff=8         # Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

set mouse=

# ================ Search ===========================

set incsearch       # Find the next match as we type the search
set hlsearch        # Highlight searches by default
set ignorecase      # Ignore case when searching...
set smartcase       # ...unless we type a capital

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell
nnoremap <silent> <C-l> :nohl<CR><C-l>

set termguicolors
set background=dark
colors base16-default-dark

g:airline_powerline_fonts = 1
g:airline_theme = 'term'
g:airline#extensions#ale#enabled = 1

g:ale_javascript_eslint_use_global = 1
g:ale_linters = { 'javascript': ['eslint', 'prettier'] }
if !empty(findfile('deno.json', '.;'))
  g:ale_linters['typescript'] = ['deno', 'eslint', 'prettier']
  g:ale_linters['typescriptreact'] = ['deno', 'eslint', 'prettier']
else
  g:ale_linters['typescript'] = ['tsserver', 'eslint', 'prettier']
  g:ale_linters['typescriptreact'] = ['tsserver', 'eslint', 'prettier']
endif

g:vim_markdown_fenced_languages = ['py=python', 'js=javascript']

asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
  'name': 'buffer',
  'allowlist': ['*'],
  'blocklist': ['go'],
  'completor': function('asyncomplete#sources#buffer#completor'),
}))
function FixBufferComplete() abort
    let l:info = asyncomplete#get_source_info('buffer')
    call l:info.on_event(l:info, {}, 'BufWinEnter')
endfunction
autocmd User asyncomplete_setup call s:FixBufferComplete()

autocmd BufNewFile,BufRead *.bs   set syntax=html
autocmd BufNewFile,BufRead *.sl   set syntax=slither
autocmd BufNewFile,BufRead *.inc  set syntax=c
autocmd BufNewFile,BufRead *.mjs  set filetype=javascript
autocmd BufNewFile,BufRead *.tab  set filetype=erlang

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif
