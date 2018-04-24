
execute pathogen#infect()

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
set shiftwidth=2            " use indents of spaces
set tabstop=2             " an identation every fou column
set softtabstop=2
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

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

