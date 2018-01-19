set nocompatible
scriptencoding utf-8

" Vundle plugin manager
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'

" Plugins
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'airblade/vim-gitgutter'
"Bundle 'frerich/unicode-haskell'
Bundle 'mbbill/undotree'

Bundle 'vim-scripts/hexHighlight.vim'

call vundle#end()

syntax enable
filetype plugin indent on

" only run gitgutter on read and write
let g:gitgutter_eager = 0

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '~'

" set leader to ,
let mapleader = ","

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Toggle undo tree
nmap <F5> :UndotreeToggle<Enter>

" Fast scrolling with space in normal mode
nmap <space> <C-D>
nmap <s-space> <C-U>

" Select all in normal mode (visual)
nmap <c-a> ggVG

" Yank into * register
vmap <c-c> "*y
nmap <c-c> "*yy

" Move lines down and up
nmap <a-j> :m .+1<Enter>
nmap <a-k> :m .-2<Enter>

" escape with jj in insert mode
imap jj <Esc>

" in insert mode using leader to wrap in things
" TODO these seem no to be very useful
inoremap <Leader>' ''<Esc>i
inoremap <Leader>" ""<Esc>i
inoremap <Leader>( ()<Esc>i
inoremap <Leader>[ []<Esc>i
inoremap <Leader>{ {}<Esc>i
inoremap <Leader>< <><Esc>i

" switch tabs
nnoremap <C-Tab> :tabn<Enter>
nnoremap <C-S-Tab> :tabp<Enter>

" break at spaces
nnoremap <Leader>j F<space>xi<Enter><Esc>^ " before
nnoremap <Leader>k f<space>xi<Enter><Esc>^ " after

set laststatus=2
set ttimeoutlen=50

set encoding=utf8


" ?
set backspace=indent,eol,start
set nobackup
set noswapfile

" Command mode
set wildmenu        " show the wildmenu bar in tab completion
                    " ignore those file extensions for completion
set wildignore=*.o,*.hi,*.class,*.pyc
set wildmode=list:longest " complete until longest match and show remaining
set history=100     " history length

" Editing
"set textwidth=80
set linebreak       " does not break in the middle of a word
set wrap            " wrap lines

set tabstop=4       " 1 tab = 4 spaces
set expandtab       " use spaces instead of tabs
set smarttab        " removes whitespaces like tabs

set shiftwidth=4    " ?
set shiftround      " ?

set autoindent      " auto indent new lines

set showmatch       " show matching bracket or parentheses

set undolevels=1000 " allow enough undos

set cursorline      " show the line where the cursor's in

set linespace=2     " temporary workarround for DejaVu Sans underscore rendering bug

set clipboard=exclude:cons\|linux " no autoselect

" abbreviations
iabbr ture true
iabbr flase false
iabbr teh the

" Searching
set smartcase       " search case insensitive when lower case
set incsearch       " show while typing
set hlsearch        " highlight search items
set ignorecase      " ignore the case


" Tabs
set tabline=2       " ?


" Style
set title           " set terminal title
set t_Co=256        " 256 colors in terminal
set number          " show line numbers
set list            " enable list mode
                    " print those characters if special characters are found
set listchars=eol:↵,precedes:‹,extends:›
set background=dark

set autochdir       " set current directory to the file we're working on

" Color scheme
if has("gui_running")
    colorscheme softdark
else
    colorscheme softdark
endif

" ------------ airline ------------

"set fillchars+=stl:\ ,stlnc:\
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'softdark'
"

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" pass
" --------------------------------------------
" Don't backup files in temp directories or shm
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
endif

" Don't keep swap files in temp directories or shm
if has('autocmd')
    augroup swapskip
        autocmd!
        silent! autocmd BufNewFile,BufReadPre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noswapfile
    augroup END
endif

" Don't keep undo files in temp directories or shm
if has('persistent_undo') && has('autocmd')
    augroup undoskip
        autocmd!
        silent! autocmd BufWritePre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noundofile
    augroup END
endif

" Don't keep viminfo for files in temp directories or shm
if has('viminfo')
    if has('autocmd')
        augroup viminfoskip
            autocmd!
            silent! autocmd BufNewFile,BufReadPre
                \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
                \ setlocal viminfo=
        augroup END
    endif
endif
