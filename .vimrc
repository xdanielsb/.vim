execute pathogen#infect()

"mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on

filetype off                  " required

" set the runtime path to include Vundle and initialize
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :source %
" :PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'lepture/vim-jinja'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-commentary'
Plugin 'janko/vim-test'
Plugin 'valloric/youcompleteme'
Plugin 'chiel92/vim-autoformat'
Plugin 'leafoftree/vim-vue-plugin'
Plugin 'prettier/vim-prettier'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" nerd-tree, syntastic,emmet vim , ctrlp
"cd ~/.vim/bundle && git clone git://github.com/tpope/vim-commentary.git gc gcc
"cd ~/.vim && git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim  "awesome pluging to open files

set nu "add numbers to each line
set cursorline " highlight the current line
hi cursorline guibg=#FFF633 " highlight the current line with  yellow colour
hi CursorColumn guibg=#FFF633 " highlight cursor

set nowrap
set tabpagemax=15                 " only show 15t tabs
set showmode              " always show the mode
set linespace=0           " no extra spaces for dummies
set incsearch             " find as you type search
set hlsearch              " highlight search terms
set ignorecase            " case insensitive search
set smartcase             " use case if any caps used to search
set wildmenu              " search in the statusvar
set wildmode=list:longest,full "list matches, then longest common part, then all
"set foldenable             "auto fold code
set autoindent            " indint at the same level of the previous line

"by default, the indent is 2 spaces.


if  &filetype ==# 'python'
  set shiftwidth=4        " number of spaces to use for auto indent
  set softtabstop=4
  set tabstop=4           " use 2 spaces to represent the tab
else
  set shiftwidth=2        " number of spaces to use for auto indent
  set softtabstop=2
  set tabstop=2           " use 2 spaces to represent the tab
endif

set expandtab           " enter spaces when tab is pressed
" for html/rb files, 2 spaces
autocmd Filetype python setlocal  shiftwidth=4 sw=4 expandtab

set mouse=a               " enable mouse support
" map <C-n> :NERDTree       " Map Ctrl+n to open nerd tree ctrl+w w to come back to the nerd tree, press t to open in a new tab.
map <C-s> :wa<CR>            " Fast save
map <C-v> <C-b>          " Map open vertical to avoid conflicts with Multiplexer

set foldcolumn=1  "Add a bit extra margin to the left

if system('uname') == "Darwin\n"  "Enable copy and paste from system's clipboard
  set clipboard=unnamed "OSX
els
  set clipboard=unnamedplus "Linux
endif

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
map <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
" press t after ctrl +n, cool for testing <vim-test>

nmap <silent> t<C-n> :TestNearest -s<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" :echo fnamemodify(expand('%'), ':t') " show the name of the current file

" CtrlP
let g:ctrlp_map = '<C-p>'

" CtrlP
let g:ctrlp_cmd = 'CtrlP'
map <C-p> :CtrlP <CR>

" Saving folds that are created
autocmd BufWinLeave *.* mkview              " Saves code folds as a view

autocmd BufWinEnter *.* silent loadview     " Loads the saved view containing the code folds
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*,*/.pyc\*,*.so,/*.swp,/*.zip,/*.out
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/.pyc,*/node_modules/*,/*.so,/*.swp,/*.zip,/*.out

endif

let g:NERDTreeIgnore=['node_modules']

" Ignore for NerdTree

" Close vim if only NERDTree window is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"Open NERDTree on startup
"autocmd vimenter * NERDTree

" Map ctrl-f to open NERDTree
"
map <C-f> :NERDTreeToggle  <CR>

set ma  "Make the files modifiable in nerd tree."

" Disable syntastic
map <C-a> :SyntasticToggleMode


" Syntastic basic settings
" :help syntastic-checkers

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" for c++ 11
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" pip3 install pylint==1.9.2
" pip3 install flake8
let g:syntastic_python_checkers = ['pep8', 'flake8', 'black']

" npm install -g jshint
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_cpp_checkers = ['gcc']

" to display the checkers
"move lines up or down
nnoremap <A-j> :m .+1<CR>==  "alt j
nnoremap <A-k> :m .-2<CR>==  "alt k

"Code for the parenthesis
""inoremap ( ()<Esc>i
""inoremap { {}<Esc>i
""inoremap [ []<Esc>i
""inoremap " ""<Esc>i
""inoremap ' ''<Esc>i

"Enable tab navigation
nmap <C-S-tab> :tabprevious<CR>
nmap <C-tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <Esc>:tabprevious<CR>i
imap <C-tab> <Esc>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>

" cd ~/.vim/bundle/YouCompleteMe
" python3 install.py --clang-completer --system-libclang

"font
"set guifont=Monospace\ 11

" cd ~/.vim && git clone https://github.com/flazz/vim-colorschemes.git && git submodule add https://github.com/flazz/vim-colorschemes.git bundle/colorschemes
"background default -  elflord - evening - darkblue - industry torte
"
let hr = (strftime("%H"))
if hr > 19
  colorscheme evening
else
  "colorscheme default
  colorscheme evening
endif

" Jinja templates
" au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja





" switch tabs faster [ shift + h, shift +l ]
nnoremap H gT
nnoremap L gt

" height command line
set cmdheight=2


" npm install -g js-beautify
" pip install black
" au BufWrite * :Autoformat " format the code upon save the file

let g:prettier#autoformat = 1


" avoid conflict for syntastic cpp
let g:ycm_show_diagnostics_ui = 0


" make available relative number
set rnu


" commands
"   move to last editing place   g;
"   move first line gg
"   move last line G
