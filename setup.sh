#!/bin/bash
# Description: Setup dotfiles
# Author: DeedWark
# Date: 2024-01
# Version: 1.0.0

check_pkg() {
  if ! which "$1" >/dev/null 2>&1; then
    echo "$1 not found! Please install it before continue" >&2
    exit 1
  fi
}

set_omz() {
  check_pkg "zsh"
  check_pkg "git"
  check_pkg "curl"
  curl -fsSL "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | sh -
  cp "deedwark.zsh-theme" "$HOME/.oh-my-zsh/themes/deedwark.zsh-theme"

  echo -e "\n[\x1b[1;92m JUST RELOAD ZSH \x1b[0m]\n"
}

set_vim() {
  check_pkg "vim"
  check_pkg "curl"
  check_pkg "npm"
  curl -fLo "$HOME/.vim/autoload/plug.vim" \
    --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  if [[ -f "$HOME/.vimrc" ]]; then
    edate=$(date +%s)
    mv "$HOME/.vimrc" "$HOME/.vimrc.BKP-$edate"
    echo "Old $HOME/.vimrc file saved as $HOME/.vimrc.BKP-$edate"
  fi
  cp ".vimrc" "$HOME/.vimrc"
  echo -e "\n[\x1b[1;92m JUST LAUNCH vim AND TYPE :PlugInstall \x1b[0m]\n"
}

set_nvim() {
  check_pkg "nvim"
  check_pkg "curl"
  check_pkg "npm"
  curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  if [[ -f "$HOME/.config/nvim/init.vim" ]]; then
    edate=$(date +%s)
    mv "$HOME/.config/nvim/init.vim" "$HOME/config/nvim/init.vim.BKP-$edate"
    echo "Old $HOME/.config/nvim/init.vim file saved as $HOME/config/nvim/init.vim.BKP-$edate"
  fi
  cp ".config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
  echo -e "\n[\x1b[1;92m JUST LAUNCH nvim AND TYPE :PlugInstall \x1b[0m]\n"
}

set_tmux() {
  check_pkg "tmux"
  check_pkg "git"
  if [[ -f "$HOME/.tmux.conf" ]]; then
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.BKP"
    edate=$(date +%s)
    echo "Old $HOME/.tmux.conf file saved as $HOME/.tmux.conf.BKP-$edate"
  fi
  git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
  cp ".tmux.conf" "$HOME/.tmux.conf"
  echo -e "\n[\x1b[1;92m JUST LAUNCH tmux AND TYPE Ctrl + b and I \x1b[0m]\n"
}

set_bash_alias() {
  if [[ -f "$HOME/.bash_aliases" ]]; then
    edate=$(date +%s)
    mv "$HOME/.bash_aliases" "$HOME/.bash_aliases.BKP-$edate"
    echo "Old $HOME/.bash_aliases saved as $HOME/.bash_aliases.BKP-$edate"
  fi
  cp ".bash_aliases" "$HOME/.bash_aliases"

  if ! grep ".bash_aliases" "$HOME/.bash_aliases" >/dev/null 2>&1; then
    cat <<EOF >>"$HOME/.zshrc"

# Bash Aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
EOF
  fi
}

set_omz
set_vim
# set_nvim
set_tmux
set_bash_alias
