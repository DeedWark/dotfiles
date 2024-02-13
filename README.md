# .dotfiles
- My useful .dotfiles to gives gooood sensatioooons 🎼🎶🎵

#### Packages to install before
- bash        (to execute this setup script)
- git         (to clone git reposiory)
- zsh         (required by oh-my-zsh)
- curl        (to download oh-my-zsh, vim plugins)
- vim OR nvim (bests text editor)
- tmux        (terminal multiplexer)
- npm         (for vim/nvim plugins)

## Oh My ZSH theme
```bash
cp deedwark.zsh-theme ~/.oh-my-zsh/themes/
```

## VIM Plug
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## NVIM Plug
```bash
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## TMUX part
- TMUX Plugin Manager:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
