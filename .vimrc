"------------"
"-- BASICS --"
"------------"
syntax on
syntax enable
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
filetype plugin indent on
set termguicolors
" Check No-Break Space (U+00A0 - 0xC2 0xA0 - <0xa0> - NBSP)
match Error /\%xA0/

"--------------"
"-- SHORTCUT --"
"--------------"
" When you were not sudo and what you do is fucked up
cmap w!! w !sudo tee % >/dev/null
cmap teebag w !sudo tee % >/dev/null
" Auto banner for .sh script
cmap hbash 0put =\"#!/bin/bash\n# Description:\n# Author:\n# Date:\n# Version:\n\n\n\"
" Remove fucking special char (AltGr + Space missclicking)
cmap fuckingspace %s/ / /g
cmap ooh %s/ / /g

" BufNewFile    => Starting to edit a file that doesn't exist
" BufWritePost  => After writing the whole buffer to a file 
" FileWritePost => After writing part of a buffer to a file

" SHELL Files
autocmd BufNewFile *.sh 0put =\"#!/bin/bash\<nl># Description:\<nl># Author:\<nl># Date:\<nl># Version:\<nl>\<nl>\"|$

" Golang Files
autocmd BufWritePost,FileWritePost *.go silent! :GoFmt 

" YAML Files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml set cuc cul 
autocmd FileType yaml let g:indentLine_char = '⦙'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

" JSON Files
"autocmd FileType json set cuc cul
"autocmd FileType json let g:indentLine_char = '|'
"let g:vim_json_conceal=0

" Clang formatting
"autocmd FileType c ClangFormatAutoEnable
let g:clang_format#style_option = {
      \ "AccessModifierOffset": -4,
      \ "AllowShortIfStatementsOnASingleLine": "false",
      \ "AlwaysBreakTemplateDeclarations": "true",
      \ "Standard": "C++11"}

let g:ale_linters = {
      \ 'c': ['clang-format'],
      \ 'cc': ['clang-format'],
      \ 'sh': ['shfmt'],
      \}

"-------------"
"-- PLUGINS --"
"-------------"
call plug#begin()
" Auto indent Shell script
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
" Color GitHub
Plug 'cormacrelf/vim-colors-github'
" Golang linter
Plug 'darrikonn/vim-gofmt'
" Color ayu
Plug 'ayu-theme/ayu-vim'
" Puppet code linter
Plug 'rodjek/vim-puppet'
" Commentary (comment full block)
Plug 'tpope/vim-commentary'
" Indent line (beautiful)
Plug 'Yggdroot/indentLine'
" HAproxy config fmt
Plug 'Joorem/vim-haproxy'
" C Lang fmt
Plug 'rhysd/vim-clang-format'
" Rust fmt
Plug 'rust-lang/rust.vim'
" Python fmt
Plug 'tell-k/vim-autopep8'
" Analysis (multiple language linter/checker)
Plug 'dense-analysis/ale'
call plug#end()

"------------"
"-- THEMES --"
"------------"
" GRUVBOX THEME
colorscheme retrobox
set background=dark

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

" TENDER THEME
" colorscheme tender

