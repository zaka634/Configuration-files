" Language and font setting
let $LANG = 'en'
set langmenu=none
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    " set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set guifont=Consolas:h12:cANSI
  endif
endif

let g:airline_theme='one'
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme one
set background=dark " for the dark version
" set background=light " for the light version
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

" For Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"leader key mapping
map <leader>h :set hlsearch!<cr>
map <leader>w :%s/
map <leader>r y:%s/<C-r>0/
map <leader>z "_

