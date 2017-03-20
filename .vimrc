execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/plugged')
let g:plug_url_format = 'git@github.com:fatih/%s.git'
Plug 'vim-go'
unlet g:plug_url_format
call plug#end()

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wakatime/vim-wakatime'
Plugin 'fatih/vim-go'
Plugin 'mattn/emmet-vim'


" after do this you run in the vim consoles :source %
" and PluginInstall to install the plugins
" after yo go to /.vim/bundle/YouCompleteMe and run the code ./install.py --all

" End configuration, makes the plugins available
call vundle#end()
filetype plugin indent on    " required

"it is necesary clonar el repor de sintastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
"numera las lineas
set nu

autocmd VimEnter * wincmd p



set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:go_list_type = "quickfix"

" for emmet
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

source $VIMRUNTIME/mswin.vim
behave mswin

set cursorline  				" highlight current line
hi cursorline guibg=#FFF633 	" highlight bg color of current line
hi CursorColumn guibg=#FFF633   " highlight curso


set tabpagemax=15 				" only show 15 tabs
set showmode                   	" display the current mod
set backspace=indent,eol,start	" backspace for dummys
set linespace=0					" No extra spaces between rows
set nu							" Line numbers on
set showmatch					" show matching brackets/parenthesis
set incsearch					" find as you type search
set hlsearch					" highlight search terms
set winminheight=0				" windows can be 0 line high 
set ignorecase					" case insensitive search
set smartcase					" case sensitive when uc present
set wildmenu					" show list instead of just completing
set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
set scrolljump=5 				" lines to scroll when cursor leaves screen
set scrolloff=3 				" minimum lines to keep above and below cursor
set foldenable  				" auto fold code
set gdefault					" the /g flag on :s substitutions by default
set nowrap                     	" wrap long lines
set autoindent                 	" indent at the same level of the previous line
set shiftwidth=4               	" use indents of 4 spaces
set expandtab 	  	     		" tabs are spaces, not tabs
set tabstop=4 					" an indentation every four columnn
set softtabstop=4 			

"its necesary to create a folder in ~/.vim  called colors and there ad the theme that you download:
syntax enable
"set background=light
"set background=dark
"colorscheme solarized
"colorscheme atom-dark

colorscheme atom-dark-256

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

set noswapfile
set nobackup
set nowritebackup

filetype plugin on

setlocal omnifunc=go#complete#Complete
