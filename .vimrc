set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'solarnz/thrift.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/powerline'
Plugin 'docunext/closetag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'AutoClose'
" Highlight trailing whitepsace
Bundle 'ntpeters/vim-better-whitespace'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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

" Colorscheme
let &t_Co=256
colorscheme molokai
set transp=12
syntax on

set number
set hlsearch
let mapleader = ","
nmap <leader>ne :NERDTreeToggle<cr>

" Wildmode mene (tab completion)"
set wildmode=longest,list,full
set wildmenu

set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set mouse=a

" Commit message guidelines
au FileType gitcommit set tw=72
au FileType gitcommit set cc=50
au FileType gitcommit set spell

" Scala margin
au FileType scala set cc=100

"4 spaces per indent in python
au FileType python set tabstop=4
au FileType python set shiftwidth=4

" Golang syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
syntax on

set hidden
