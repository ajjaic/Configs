" First install and run this -> git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Run :PluginUpdate
" goto ~/.vim/bundles/vimproc.vim
" Run make

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" necessary for lots of cool vim things
set nocompatible
filetype off
filetype plugin off
filetype plugin indent off

let mapleader = "," " map leader

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"Keep Plugin commands between vundle#begin/end.
call vundle#begin()

"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'vim-scripts/wombat256.vim'

"All of your Plugins must be added before the following line
call vundle#end()

"Put your non-Plugin stuff after this line

"trim trailing spaces
function! TrimTrailingWhitespace()
    execute "normal mz"
    %s/\s\+$//ge
    execute "normal `z"
endfunction

if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    "automatically reload vimrc when it is saved
    autocmd BufWritePost .vimrc source ~/.vimrc
    "remove any trailing whitespace in the file
    autocmd BufWrite * :call TrimTrailingWhitespace()
    "jump to last position when opening file
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    "do not show matching parenthesis
    autocmd VimEnter * NoMatchParen
endif

if !has('nvim')
    " Only set this for vim, since newovim is utf8 as default and setting it
    " causes problems when reloading the .vimrc configuration
    set encoding=utf8
endif

"general Settings
syntax enable
syntax on
filetype on
filetype plugin on
filetype plugin indent on

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"kill ex mode
nnoremap Q <nop>

"tell the term has 256 colors
set t_Co=256

"set unix as standard file type
set ffs=unix,dos,mac

"relative line numbers
set relativenumber

"block edit in visual mode
set virtualedit=block

"wrap or no wrap
set nowrap

"indent settings
set shiftwidth=2 "no of spaces for autoindent
set tabstop=2

"expand tabs to spaces
set expandtab

"indent instead of tab at start of line
set smarttab

"set 7 lines to the cursor when moving vertically
set so=7

"configure wild menu
set wildmenu
set wildmode=list:longest,full
"set wildignore=*.o,*~,*.py[co],*.obj,*.bak
"set wildignore+=*.png,*.jpg,*.gif
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"dont continue comments when pushing o/O
set formatoptions-=o

"enable mouse support in console
set mouse=a

"autoread files changed outside vim
set autoread

"allow buffers to exist in the background even if it is not in Window
set hidden

"display command in lower right corner
set showcmd

"use 2 lines for status bar
set laststatus=2

"case insenstive while searching
set ignorecase

"case sensitive if search pattern contains uppercase characters
set smartcase

"highlight search words
set hlsearch

"incremental searching
set incsearch

"do we need backups
set nobackup

"we do not need any swapfile and no writeback
set noswapfile
set nowb

"minimal number of lines to keep above and below cursor
set scrolloff=7

"indent and keep selection so that i can do it again
vnoremap < <gv
vnoremap > >gv

"remap jk to escape from insert mode.
inoremap jk <Esc>

"edit vimrc file
nnoremap  <leader>ev :e ~/.vimrc<CR>

"clear highlighted text
nnoremap <leader>, :noh<CR>

"buffer settings
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>

"page down and Page up
nnoremap <C-j> }
nnoremap <C-k> {

"close every window in current tabview but the current
nnoremap <leader>bo <c-w>o

"save file
nnoremap <leader>w :w<CR>

"save all files
nnoremap <leader>l :wa<CR>

"save all and quit
nnoremap <leader>x :wa<CR>:q<CR>

"navigate display lines
nnoremap j gj
nnoremap k gk

"search highlighted text
vnoremap / yq/p<CR>

"folding config
set foldmethod=marker
set foldcolumn=3
vnoremap <leader>c zf
nnoremap <leader>a za
nnoremap <leader>m zM
nnoremap <leader>r zR

""""""""""""""""""""
"  PLUGINS  CONFIG "
""""""""""""""""""""

"easyMotion
let g:EasyMotion_do_mapping = 0
map f <Plug>(easymotion-s)

"unite
let g:unite_prompt = '>>'
nnoremap <silent> <leader>ut :Unite -start-insert file_rec/async<CR>
nnoremap <silent> <leader>uv :Unite -start-insert buffer<CR>
nnoremap <silent> <leader>ul :Unite -start-insert line<CR><CR>
nnoremap <silent> <leader>uc :Unite -start-insert history/command<CR>
nnoremap <silent> <leader>uy :Unite history/yank<CR>
nnoremap <silent> <leader>um :Unite -start-insert file_mru<CR>
nnoremap <silent> <leader>us :Unite history/search<CR>
nnoremap <silent> <leader>up :Unite grep:./*<CR>
nnoremap <silent> <leader>ug :UniteWithCursorWord grep:./*<CR>
nnoremap <silent> <leader>ub :Unite grep:$buffers<CR>
nnoremap <silent> <leader>uw :UniteWithCursorWord grep:$buffers<CR>
nnoremap <silent> <leader>uf :UniteWithCursorWord file_rec/async<CR>
nnoremap <silent> <leader>ud :UniteWithBufferDir -start-insert file<CR>

"tabularize
vnoremap <leader>ta :Tabularize/=<CR>

"tpope commentary
nnoremap <leader>cc :Commentary<CR>

"airline
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_symbols.space = "\ua0"

"nerdTree
nnoremap <silent><leader>nn :NERDTreeToggle<CR>:wincmd =<CR>
let g:NERDTreeIgnore = ['\.pyc$']
hi Directory guifg=#8ac6f2

"colorscheme
try
    colorscheme wombat256mod
catch
endtry
hi! link SignColumn LineNr
