setxkbmap -option ctrl:nocaps
export TERM=xterm-256color
export XDG_CONFIG_HOME=~/.config
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
