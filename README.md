# .dotfiles
- My useful .dotfiles to gives gooood sensatioooons 🎼🎶🎵

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
