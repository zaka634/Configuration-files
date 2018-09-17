" Language and font setting
let $LANG = 'en'

syntax on
filetype plugin indent on
let mapleader=","
set clipboard=unnamed
set nu
set rnu
set nowrap
set hidden
set incsearch
set hlsearch
set ignorecase
set smartcase
set backup
set backupdir=D:/vimTempFiles
set dir=D:/vimTempFiles
set undodir=D:/vimTempFiles
set laststatus=2

set pastetoggle=<F10>
" keymapping
map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3
map <F7> mzgg=G`z

map D "_dd
" Plugin Management
map <C-n> :NERDTreeToggle<CR>
imap kj <Esc>


"leader key mapping
map <leader>h :set hlsearch!<cr>
map <leader>w :%s/
map <leader>r y:%s/<C-r>0/
map <leader>z "_

