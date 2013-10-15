" Necessary for lots of cool vim things
set nocompatible
filetype off

" Map leader
let mapleader = ","

" Vundle vim plugin manager
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" My Bundles
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'unite.vim'
Bundle 'h1mesuke/unite-outline'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'Raimondi/delimitMate'

" Trim trailing spaces
function! TrimTrailingWhitespace()
    execute "normal mz"
    %s/\s\+$//ge
    execute "normal `z"
endfunction

if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    "Automatically reload vimrc when it is saved
    autocmd BufWritePost .vimrc source ~/.vimrc
    "Remove any trailing whitespace in the file
    autocmd BufWrite * :call TrimTrailingWhitespace()
    "Jump to last position when opening file
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" General Settings
syntax enable
syntax on
filetype on
filetype plugin on
filetype plugin indent on

" Basic editing
set t_Co=256
set number
" set cursorline
set virtualedit=block
set nowrap
set tabstop=4
"No of spaces for autoindent
set shiftwidth=4
"Expand tabs to spaces
set expandtab
set backspace=indent,eol,start
"Auto indent everything
set autoindent
"Copy previous indentation on autoindenting
set copyindent
"Use multiple of shiftwidth when indenting
set shiftround
"Sets linespace (px between lines)
set linespace=1
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.py[co],*.obj,*.bak
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"Enable mouse support in console
set mouse=a
"Autoread files changed outside vim
set autoread
"Allow buffers to exist in the background even if it is not in Window
set hidden
"Show file name in title bar
set title
"Show cursor position in status bar
set ruler
" Display command in lower right corner
set showcmd
"Show mode in status bar
set showmode
"Use 2 lines for status bar
set laststatus=2
"Don't show the current mode at the bottom (since powerline does it)
set noshowmode
"Show matching braces
set showmatch
"Case insenstive while searching
set ignorecase
"Case sensitive if search pattern contains uppercase characters
set smartcase
"Highlight search words
set hlsearch
"Incremental searching
set incsearch
"Use the OS clipboard by default
set clipboard=unnamedplus
" Do we need backups
set nobackup
set noswapfile
"Do not store options and folds in a session file set ssop-=options
set nowb
set ssop-=folds
"Always split to the right and below
set splitright
"set splitbelow
"Minimal number of lines to keep above and below cursor
set scrolloff=30
set scrolljump=5
"Lower delay of escaping out of other modes
set timeout timeoutlen=1000 ttimeoutlen=0

" Change color of line numbers
highlight LineNr ctermfg=blue ctermbg=black

" indent and keep selection so that i can do it again
vnoremap < <gv
vnoremap > >gv

" Remap jj to escape from insert mode.
inoremap jk <Esc>

" Edit vimrc file
nnoremap <silent> <Leader>ev :e ~/.vimrc<CR>

" Clear highlighted text
map <leader>s :noh<cr>

" Buffer settings
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>

" File Explorer
nnoremap <C-j> :Ex<CR>

" Navigating the display lines
nnoremap j gj
nnoremap k gk

" EasyMotion mappings
let g:EasyMotion_mapping_f = 'f'
let g:EasyMotion_mapping_F = 'F'

" vim-airline mappings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Unite mappings
let g:unite_prompt = '→'
nnoremap <silent> <Leader>t :Unite -start-insert file_rec<CR>
nnoremap <silent> <Leader>b :Unite -start-insert buffer<CR>
nnoremap <silent> <Leader>m :Unite -start-insert file_mru<CR>
nnoremap <silent> <leader>o :Unite -start-insert outline<cr>
nnoremap <silent> <leader>l :Unite -start-insert line<cr>
nnoremap <silent> <leader>d :UniteWithBufferDir -start-insert file<cr>

" Bufkill mappings
cnoremap bd BD
