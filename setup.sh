#!/bin/bash
# Description:
# Author:
# Date:
# Version:

PACKAGES="tmux vim zsh yamllint"
CURDATE=$(date '+%y%m%d%H%S')

check_uid() {
  if [[ "$UID" -ne 0 ]]; then
    echo "Current user: $(whoami) - You're not the right buddy"
  fi
}

check_pkg() {
  if ! which "$1" >/dev/null 2>&1; then
    echo "Package $1 not found, don't forget to install it"
    exit 1
  fi
}

check_all_packages() {
  for pkg in $PACKAGES; do
    check_pkg "$pkg"
  done
}

tmux_setup() {
  check_pkg "tmux"

  if [[ -f "$HOME/.tmux.conf" ]]; then
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.old.$CURDATE"
  fi

  cp "./.tmux.conf" "$HOME/.tmux.conf"
}

vim_setup() {
  check_pkg "vim"

  if [[ -f "$HOME/.vimrc" ]]; then
    mv "$HOME/.vimrc" "$HOME/.vimrc.old.$CURDATE"
  fi

  if [[ -d "$HOME/.vim" ]]; then
    mv "$HOME/.vim" "$HOME/.vim.old.$CURDATE"
  fi

  cp "./.vimrc" "$HOME/.vimrc"
  cp -r "./.vim" "$HOME/.vim"

  vim +PlugInstall +qall
}

omz_setup() {
  check_pkg "zsh"

  check_pkg "curl"

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  if [[ -d "$HOME/.oh-my-zsh" ]]; then
    cp "./deedwark.zsh-theme" "$HOME/.oh-my-zsh/themes/deedwark.zsh-theme"
  fi

  if [[ ! -f "$HOME/.zshrc" ]]; then
    touch "$HOME/.zshrc"
  fi
  sed -i 's/ZSH_THEME/#ZSH_THEME/g' "$HOME/.zshrc"
  sed -i '/^#ZSH_THEME=.*/a ZSH_THEME="deedwark"' "$HOME/.zshrc"
  
}

yamllint_setup() {
  check_pkg "yamllint"

  if [[ -f "$HOME/.config/yamllint/config" ]]; then
    mv "$HOME/.config/yamllint/config" "$HOME/.config/yamllint/config.old.$CURDATE"
  fi
  
  if [[ -d "$HOME/.config" ]]; then
    mkdir -p "$HOME/.config/yamllint"
    cp -r "./.config/yamllint" "$HOME/.config/yamllint"
  fi
}

main() {
  check_all_packages
  tmux_setup
  vim_setup
  omz_setup
  yamllint_setup
}
main
