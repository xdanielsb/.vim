execute pathogen#infect()

"mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on

"cd ~/.vim && git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim 
set runtimepath^=~/.vim/bundle/ctrlp.vim  "awesome pluging to open files

set nu "add numbers to each line
set cursorline " highlight the current line 
hi cursorline guibg=#FFF633 " highlight the current line with  yellow colour
hi CursorColumn guibg=#FFF633 " highlight cursor

set tabpagemax=15                 " only show 15t tabs
set showmode              " always show the mode
set linespace=0           " no extra spaces for dummies
set incsearch             " find as you type search
set hlsearch              " highlight search terms
set ignorecase            " case insensitive search
set smartcase             " use case if any caps used to search
set wildmenu              " search in the statusvar 
set wildmode=list:longest,full "list matches, then longest common part, then all
set foldenable             "auto fold code 
set autoindent            " indint at the same level of the previous line 

"by default, the indent is 2 spaces. 
set shiftwidth=2				" number of spaces to use for auto indent
set softtabstop=2
set tabstop=2						" use 2 spaces to represent the tab
set expandtab           " enter spaces when tab is pressed

" for html/rb files, 2 spaces
autocmd Filetype python setlocal  shiftwidth=2 sw=2 expandtab

set mouse=a               " enable mouse support
map <C-n> :NERDTree       " Map Ctrl+n to open nerd tree ctrl+w w to come back to the nerd tree, press t to open in a new tab.
map <C-s> :w!             " Fast save

set foldcolumn=1  "Add a bit extra margin to the left
set clipboard=unnamedplus "Enable copy and paste from system's clipboard

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Saving folds that are created
autocmd BufWinLeave *.* mkview              " Saves code folds as a view
autocmd BufWinEnter *.* silent loadview     " Loads the saved view containing the code folds

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*,.pyc\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/.pyc
endif

" Close vim if only NERDTree window is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"Open NERDTree on startup
"autocmd vimenter * NERDTree

" Map ctrl-f to open NERDTree
map <C-f> :NERDTreeToggle<CR>
set ma  "Make the files modifiable in nerd tree."

" Disable syntastic 
map <C-a> :SyntasticToggleMode


" Syntastic basic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" for c++ 11
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
