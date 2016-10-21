execute pathogen#infect()
let mapleader=","
set clipboard=unnamed
set rnu
set nowrap
" setting for search option
set incsearch
set hlsearch
" keymapping
map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <nop>
vnoremap <Right> <nop>

"leader key mapping
map <leader>h :set hlsearch!<cr>
map <leader>s :%s/
