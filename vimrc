" First install and run this -> git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Run :PluginUpdate
" goto ~/.vim/bundles/vimproc.vim
" Run make
" sudo apt install silversearcher-ag (required for denite)
" sudo apt install ctags (required by tagbar)
" sudo apt install python3-pip (dependency for nvim-yarp)
" pip install neovim (dependency for nvim-yarp)

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"necessary for lots of cool vim things
set nocompatible
filetype off
filetype plugin off
filetype plugin indent off

let mapleader = "," " map leader

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"keep Plugin commands between vundle#begin/end.
call vundle#begin()

"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/wombat256.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/deoplete.nvim'

  "following 2 plugins are dependencies for deoplete
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

  "unite replacement?
Plugin 'Shougo/denite.nvim'
  "unite most recently used
Plugin 'Shougo/neomru.vim'
  "unite yank history
Plugin 'Shougo/neoyank.vim'
  "unite command/search history
Plugin 'thinca/vim-unite-history'

"rust specific
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'sebastianmarkow/deoplete-rust'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'

"all of your Plugins must be added before the following line
call vundle#end()

"put your non-Plugin stuff after this line

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
    "only set this for vim, since newovim is utf8 as default and setting it
    "causes problems when reloading the .vimrc configuration
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

"don't bing when I fuck up
set noerrorbells

"relative line numbers
set nu
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

"configure wild menu
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.py[co],*.obj,*.bak
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

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
set scrolloff=5

"indent and keep selection so that i can do it again
vnoremap < <gv
vnoremap > >gv

"remap jk to escape from insert mode.
inoremap jk <Esc>

"edit vimrc file
nnoremap  <leader>ev :e ~/.vimrc<cr>

"clear highlighted text
nnoremap <leader>, :noh<cr>

"buffer settings
nnoremap <C-l> :bn<cr>
nnoremap <C-h> :bp<cr>
  "jump to previously visited buffer
nnoremap <Tab> :b#<cr>

"saving
nnoremap <leader>w :w<cr>
  "save all files
nnoremap <leader>l :wa<cr>
  "save all and quit
nnoremap <leader>x :wa<cr>:q<cr>
  "quit without saving
nnoremap <leader>q :q!<cr>

"navigate display lines
nnoremap j gj
nnoremap k gk

"navigate paragraphs
nnoremap <C-j> }
nnoremap <C-k> {

"search highlighted text
vnoremap / yq/p<cr>

"partial command filter on command history
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

"vim should not behave differently depending on the first few lines of a file
set nomodeline

"folding config
set foldmethod=marker
set foldcolumn=3
  "create fold
vnoremap <leader>fc zf
  "toggle fold
nnoremap <leader>fa za
  "contract all folds
nnoremap <leader>fm zM
  "expand all folds
nnoremap <leader>fr zR
  "delete specific fold
nnoremap <leader>fd zd
  "delete all folds
nnoremap <leader>fe zE

"dim and undim comments
nnoremap <leader>dc :hi! link Comment Ignore<cr>
nnoremap <leader>ec :hi! link Comment Comment<cr>

"'md' files are markdown files. not modula files
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

"visually show when I enter and leave `insert` mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

"set column limit to 80
set colorcolumn=121
highlight ColorColumn ctermbg=0

"disable a preview window from opening up during autocompletion. happens with deoplete
set completeopt-=preview

"clipboard settings to enable yanking/pasting from/to vim or other programs
"seems to work only in win or linux
"need to investigate further, cos it does not work
" set clipboard=unnamedplus,autoselect

"sets linespace between lines (in px.Works only in GUI version. gVim or MacVim)
"set linespace=0

""""""""""""""""""""
"  PLUGINS  CONFIG "
""""""""""""""""""""

"easyMotion
let g:EasyMotion_do_mapping = 0
hi link EasyMotionTarget2First EasyMotionTarget
map f <Plug>(easymotion-s)

"unite
" call unite#custom#source('file_rec/async,file_mru,file,buffer,grep', 'ignore_pattern', '*.pyc\|.gitignore\|.prospector.yaml\|.git/|./them.*/*|*.sql|./testing/*')
nnoremap <leader>uv :Unite -start-insert buffer<cr>
nnoremap <leader>uy :Unite history/yank<cr>
nnoremap <leader>um :Unite -start-insert file_mru<cr>
nnoremap <leader>us :Unite history/search<cr>
nnoremap <leader>ub :Unite grep:$buffers<cr>
nnoremap <leader>uw :UniteWithCursorWord grep:$buffers<cr>

"denite
" call denite#custom#map('insert', ':q', '<denite:quit>', 'noremap')
call denite#custom#map('insert', 'jk', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
nnoremap <leader>ul :Denite line<cr>
nnoremap <leader>uc :Denite command_history<cr>
nnoremap <leader>up :Denite grep:.<cr>
nnoremap <leader>ut :DeniteProjectDir file_rec<cr>
nnoremap <leader>ud :DeniteBufferDir file<cr>
nnoremap <leader>ug :DeniteCursorWord grep:. -mode=normal<cr>
nnoremap <leader>uf :DeniteCursorWord file_rec -mode=normal<cr>

"tabularize
vnoremap <leader>ta :Tabularize/=<cr>

"tpope commentary
noremap <leader>cc :Commentary<cr>

"airline
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled=1

"colorscheme
try
    colorscheme wombat256mod
catch
endtry
hi! link SignColumn LineNr

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <Leader>st :SyntasticToggleMode<cr>
nnoremap <Leader>sr :SyntasticReset<cr>
nnoremap <Leader>sn :lnext<cr>
nnoremap <Leader>sp :lprev<cr>
nnoremap <Leader>sc :lclose<cr>
let g:syntastic_python_checkers = ["prospector"]
let g:syntastic_rust_checkers = ["rustc"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

"tagbar
nnoremap <Leader>tt :TagbarToggle<CR>
  "rust specific
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
    \}

"deoplete.nvim
let g:deoplete#enable_at_startup = 1
  "rust specific completions
let g:deoplete#sources#rust#racer_binary='/home/adas/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/adas/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:deoplete#sources#rust#show_duplicates=0
let g:deoplete#sources#rust#disable_keymap=1
let g:deoplete#max_menu_width=150

"rust specific commands
nnoremap <leader>rr :!clear && cargo run<cr>
nnoremap <leader>rf :RustFmt<cr>
