" INITIAL STEPS. DONE ONLY THE FIRST TIME
" 1. install vim-plug plugin manager -> sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" 2. make sure python3 is installed and then do -> pip3 install pynvim

" PLUGIN MANAGEMENT
call plug#begin()
Plug 'habamax/vim-godot'
call plug#end()

" GENERAL SETTINGS
syntax enable                           " Enables syntax highlighing
filetype plugin indent on

set iskeyword+=-                      	" treat dash separated words as a word text object"
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set fileencoding=utf-8                  " The encoding written to file
set ruler  				                      " Show the cursor position all the time
set cmdheight=1                         " More space for displaying messages
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set softtabstop=4
set ignorecase 
set smartcase 
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " Tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set incsearch                           " Search as you type
set pumheight=5                         " Determines max number of lines to show in popup menu in Insert mode
set title 
set titlestring=%F 
set titlelen=70
set hlsearch
set scrolloff=5
""" set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
""" set t_Co=256                          " Support 256 colors
""" set mouse=a                           " Mouse support
""" set showcmd
""" set showmode

" KEY MAPPING
inoremap jk <Esc>
""" nnoremap j jzz
""" nnoremap k kzz

"""""""""""""""""" PLUGINS 
" python config
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'           
