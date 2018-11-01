if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader=","
set clipboard=unnamedplus
set nu
set rnu
set nowrap
set hidden
set incsearch
set hlsearch
set ignorecase
set smartcase
set backup
set backupdir=~/temp
set dir=~/temp
set undodir=~/temp
set laststatus=2
set mouse=a
set encoding=utf-8

set pastetoggle=<F10>
" keymapping
map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3
map <F7> mzgg=G`z




"Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

let python_highlight_all=1
syntax on

" Plugin Management
map <C-n> :NERDTreeToggle<CR>

" you complete me
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

inoremap kj <Esc>

" For Syntastic

"leader key mapping
map <leader>h :set hlsearch!<cr>
map <leader>w :%s/
map <leader>r y:%s/<C-r>0/
map <leader>z "_
map <leader>1 "1p
map <leader>2 "2p
map <leader>3 "3p
map <leader>4 "4p
map <leader>5 "5p
map <leader>6 "6p
map <leader>7 "7p
