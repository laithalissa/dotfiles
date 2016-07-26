set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"> Language support
Bundle 'derekwyatt/vim-scala'
Bundle 'solarnz/thrift.vim'
Plugin 'fatih/vim-go'

"> Styling
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2

"Plugin 'altercation/vim-colors-solarized'
" Git changes in gutter
Plugin 'airblade/vim-gitgutter'

" Indent guides
Plugin 'Yggdroot/indentLine'

" Sublime-text theme
Plugin 'tomasr/molokai'
" Another color scheme
Bundle 'roosta/srcery'

" Highlight trailing whitepsace
Bundle 'ntpeters/vim-better-whitespace'

"> Helpful things
"Closes html/xml tags
Plugin 'docunext/closetag.vim'

"> Fast commenting
Plugin 'scrooloose/nerdcommenter'
"> Menus
Plugin 'scrooloose/nerdtree'

"> Better session saving
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" Multiple cursors, like in sublime text
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'

"> Experimental
"  This section is just for things I'm playing with, if I like them I'll sort
"  them into one of the sections above.

" CtrlP - fuzzy buffers/file menus
Plugin 'ctrlpvim/ctrlp.vim'

" Easily split method definitions across lines
Plugin 'andrewradev/splitjoin.vim'

" PEP8 indenting
Plugin 'hynek/vim-python-pep8-indent'
"Python mode?
"Plugin 'klen/python-mode'
" Autoclose the scratch window which opens to show you documentation
"autocmd CompleteDone * pclose

" Switch between relative and natural numbering more easily
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h10
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" Set the <leader> key to ,
let mapleader = ","

" Colorscheme
let &t_Co=256
colorscheme molokai
syntax on

" Remove scrollbars
set guioptions-=r
set guioptions-=L
" Show line numbers
set number
" Highlight all search matches- also prevents jumping when using #
set hlsearch
" Case sensitive search should be off by default
set ignorecase

" Toggle nerdtree with ,ne
nmap <leader>ne :NERDTreeToggle<cr>
" Switch off highlighting search results with ,nh
nmap <leader>nh :nohlsearch<cr>

" Close buffers easily with cb (requires the Bclose plugin)
nmap <leader>bc :Bclose<cr>

" Wildmode menu (tab completion)"
set wildmenu

" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
set softtabstop=2
set expandtab
set smartcase
set mouse=a

" Commit message guidelines
au FileType gitcommit set tw=72
au FileType gitcommit set cc=50
au FileType gitcommit set spell

" Scala - set margin to 100 characters
au FileType scala set cc=100

" Python - set 4 spaces per indent.
au FileType python set tabstop=4
au FileType python set shiftwidth=4
au FileType python set cc=80

" Golang - syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" JavaScript - Run jshint on save
let g:syntastic_jshint_exec='/opt/boxen/nodenv/shims/jshint'
let jshint2_save = 1

" Don't show pyc files in nerdtree
let NERDTreeIgnore = ['\.pyc$']

syntax on

set hidden

"" Experimental
"folding settings
"set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" Highlight the current cursor line
:set cursorline
