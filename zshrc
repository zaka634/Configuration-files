alias vi=nvim
alias log-out=gnome-session-quit

function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
}

# define right prompt, regardless of whether the theme defined it
RPS1='$(vi_mode_prompt_info)'
RPS2=$RPS1

set -o vi
bindkey -M viins 'kj' vi-cmd-mode

# my local issue
cp -r ~/.config/fcitx.bkp ~/.config/fcitx
dconf load / < ~/dconf_setting.ini

