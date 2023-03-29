syntax on
set backspace=2
set mouse=a
set nu
set smartindent
set expandtab
set tabstop=2
set softtabstop=-1
retab
set shiftwidth=2
" set cul
filetype indent on
set termguicolors
" Check No-Break Space (U+00A0 - 0xC2 0xA0 - <0xa0> - NBSP)
"set list
"set listchars=nbsp:¿

" SHORTCUT
" When you were not sudo and what you do is fucked up
cmap w!! w !sudo tee % >/dev/null
cmap teebag w !sudo tee % >/dev/null
" Auto banner for .sh script
cmap hbash 0put =\"#!/bin/bash\n# Description:\n# Author:\n# Date:\n# Version:\n\n\n\"
" Remove fucking special char (AltGr + Space missclicking)
cmap fuckingspace %s/ / /g
cmap ooh %s/ / /g

" AUTOMATION
" Sh beginning
autocmd BufNewFile *.sh 0put =\"#!/bin/bash\<nl># Description:\<nl># Author:\<nl># Date:\<nl># Version:\<nl>\<nl>\"|$
" Color file
autocmd BufEnter *.yml colorscheme github
autocmd BufEnter *.yml set cuc cul
autocmd BufEnter *.yaml colorscheme github
autocmd BufEnter *.yaml set cuc cul
autocmd BufEnter *.json set cuc cul

call plug#begin()
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
Plug 'cormacrelf/vim-colors-github'
Plug 'cocopon/iceberg.vim'
Plug 'darrikonn/vim-gofmt'
Plug 'ayu-theme/ayu-vim'
Plug 'chriskempson/base16-vim'
Plug 'rodjek/vim-puppet'
call plug#end()


" GITHUB THEME
" let g:github_colors_soft = 1
" set background=dark
" let g:github_colors_block_diffmark = 0
" colorscheme github

" AYU THEME
" let ayucolor="dark"
" let background="black"
" colorscheme ayu

"  JELLYBEANS THEME
" colorscheme jellybeans
" let g:jellybeans_overrides = {
"       \ 'background': { 'guibg': '000000' },
"       \}
" let g:jellybeans_use_lowcolor_black = 1

" BASE16-VIM THEME
" colorscheme base16-default-dark

" TENDER THEME
" colorscheme tender

" GRUVBOX THEM
colorscheme gruvbox
set background=dark

