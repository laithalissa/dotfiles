set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" >>> Language support
Bundle 'derekwyatt/vim-scala'
Bundle 'solarnz/thrift.vim'
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'GEverding/vim-hocon'

" Git changes in gutter
Plugin 'airblade/vim-gitgutter'

" >>> Linting
" Highlight trailing whitepsace
Bundle 'ntpeters/vim-better-whitespace'
" Flake8
Plugin 'nvie/vim-flake8'

" >>> Helpful things
" Closes html/xml tags
Plugin 'docunext/closetag.vim'
" Wrap phrases in quotes/parans
Plugin 'tpope/vim-surround'
" Fast commenting
Plugin 'scrooloose/nerdcommenter'

" >>> Look and feel
" Nicer startscreen
Plugin 'mhinz/vim-startify'
" Theme
Plugin 'joshdick/onedark.vim'
" Switch between relative and natural numbering more easily
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
" Status line
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2

" >>> Editor tools
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'laithalissa/bclose'
" >>> Better session saving
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" >>> Other tweaks
" Don't jump to the next search when "*" is pressed
Plugin 'bronson/vim-visual-star-search'

" >>> Experimental
"  This section is just for things I'm playing with, if I like them I'll sort
"  them into one of the sections above.
" Multiple cursors, like in sublime text
Plugin 'terryma/vim-multiple-cursors'
" Easily split method definitions across lines
Plugin 'andrewradev/splitjoin.vim'
" PEP8 indenting
Plugin 'hynek/vim-python-pep8-indent'
" Delete buffers with ctrlp
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'davidbeckingsale/writegood.vim'"
" Vertically aligning text
Plugin 'godlygeek/tabular'

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

set guifont=Iosevka

" Set the <leader> key to ,
let mapleader = ","

" Load the zsh environment - (TODO: borks terminal vim?)
"set shell=zsh\ -i

" Colorscheme
let &t_Co=256
"colorscheme luna
colorscheme onedark
syntax on

" Config for onedark
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

" Highlight the current cursor line
set cursorline
" Remove scrollbars
set guioptions-=r
set guioptions-=L
" Color for the character limit bar
highlight ColorColumn ctermbg=235 guibg=#2c2d27
" Turn off tildes for blank lines
hi NonText guifg=bg
" Show line numbers
set number
" Highlight all search matches- also prevents jumping when using #
set hlsearch
" Case sensitive search should be off by default
set ignorecase

" Toggle nerdtree with ,ne
nmap <leader>ne :NERDTreeToggle<cr>
" Redraw the screen without search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Close buffers easily with cb (requires the Bclose plugin)
nmap <leader>bc :Bclose<cr>

" Quick comment with C-q or Cmd-/
nmap <C-q> <leader>c<space>
map <D-/> <leader>c<space>

" Wildmode menu (tab completion)"
set wildmenu
set wildmode=list:longest,full

" show existing tab with 2 spaces width
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
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
au FileType python set softtabstop=4
au FileType python set cc=80

" Html gets overridden todo: find out why!
au FileType html,djangohtml set tabstop=2
au FileType html,djangohtml set shiftwidth=2
au FileType html,djangohtml set softtabstop=2

" Golang - syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Don't show pyc files in nerdtree
let NERDTreeIgnore = ['\.pyc$']

set hidden

""" Explicit plugin initialisation
call ctrlp_bdelete#init()

"" Experimental
"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
nnoremap <space> za
vnoremap <space> zf

set autoindent

" Auto refresh unmodified files when they change outside of vim
set autoread

" JavaScript - Run jshint on save
" TODO: I think this actually requires syntastic :P
let g:syntastic_jshint_exec='/opt/boxen/nodenv/shims/jshint'
let jshint2_save = 1
" Shouldn't need this!!
au FileType javascript set tabstop=2
au FileType javascript set shiftwidth=2
" Don't jump when I hit hash to show search matches
nnoremap * :keepjumps normal! mi*`i<CR>
nnoremap # :keepjumps normal! mi#`i<CR>

" Make json pretty when you're not in insert mode
au InsertEnter *.json set conceallevel=0
au InsertLeave *.json set conceallevel=2

" Nicer higlighting
hi Visual  guifg=NONE guibg=#411f7f gui=none ctermbg=91

" Disable warning for swap files
set shortmess+=A

" Highlight as you type the search!
set incsearch
" Swap files are more bother than they're worth
set noswapfile

" Startify customisation
let g:startify_change_to_dir = 1
let g:startify_list_order = ['sessions', 'bookmarks', 'sessions']
let g:startify_bookmarks = split(system("find ~/Code -not -path '*/\.*' -type d -maxdepth 1 -mindepth 1"))
