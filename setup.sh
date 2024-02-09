#!/bin/bash
# Description:
# Author:
# Date:
# Version:

set -e

_check_omz() {
  if [[ -f "$HOME/.oh-my-zsh" ]]; then
    return 0
  fi
}

load_omz() {
  if [[ ! -f "$HOME/.oh-my-zsh/themes" ]]; then
    mkdir -p "$HOME/.oh-my-zsh/themes"
  fi
  if [[ -f "$HOME/.oh-my-zsh/themes/deedwark.zsh-theme" ]]; then
    printf "Themes is already present, skip...\n" >&2
    return 0
  fi
  cp "deedwark.zsh-theme" "$HOME/.oh-my-zsh/themes/"
  mkdir -p "$HOME/.oh-my-zsh/themes"

  if ! grep "bash_aliases" >/dev/null 2>&1; then
    cat <<EOF > "$HOME/.zshrc"
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
EOF
  fi
}

_check_vim() {
  if which vim >/dev/null 2>&1; then
    return 0
  fi
}

load_vim() {
  if ! _check_vim; then
    printf "VIm not found, please install it before continue\n" >&2
    exit 1
  fi

  if [[ ! -f "$HOME/.vim/autoload/plug.vim" ]]; then
    printf "VIM Plug not found, please install it of modify this script\n" >&2
    exit 1
  fi
  cp ".vimrc" "$HOME/.vimrc"
  cp -r ".vim_kojonotoryukitawazakotomo" "$HOME/.vim_kojonotoryukitawazakotomo"
}

load_tmux() {
  if ! which tmux >/dev/null 2>&1; then
    printf "TMUX not found, please install it before continue\n" >&2
    exit 1
  fi
  cp ".tmux.conf" "$HOME/.tmux.conf"
}

main() {
  load_omz
  load_vim
  load_tmux
}

main
