set clipboard=unnamed
set rnu 
set incsearch
set hlsearch
" keymapping
noremap 0 ^ 
noremap ^ 0
inoremap <C-L> <Esc>
map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3
