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
filetype indent on
filetype plugin indent on
set termguicolors
" // Check No-Break Space (U+00A0 - 0xC2 0xA0 - <0xa0> - NBSP)
match Error /\%xA0/ 

"--------------"
"-- SHORTCUT --"
"--------------"
" // When you were not sudo and what you do is fucked up
cmap w!! w !sudo tee % >/dev/null
cmap teebag w !sudo tee % >/dev/null
" // Auto banner for .sh script
cmap hbash 0put =\"#!/bin/bash\n# Description:\n# Author:\n# Date:\n# Version:\n\n\n\"
" // Remove fucking special char (AltGr + Space missclicking)
cmap fuckingspace %s/ / /g
cmap ooh %s/ / /g

" // BufNewFile    => Starting to edit a file that doesn't exist
" // BufWritePost  => After writing the whole buffer to a file
" // FileWritePost => After writing part of a buffer to a file

" // [DOCKERFILE]
autocmd BufNewFile,BufRead *Dockerfile* set syntax=Dockerfile

" // [YAML]
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml set cuc cul
autocmd FileType yaml let g:indentLine_char = '⦙'

" // [SHELL]
autocmd BufNewFile *.sh 0put =\"#!/bin/bash\<nl># Description:\<nl># Author:\<nl># Date:\<nl># Version:\<nl>\<nl>\"|$

" // [GOLANG]
autocmd FileType go colorscheme PaperColor
" // GoImports when saving a file (add imports modules automatically)
autocmd BufWritePost,FileWritePost *.go silent! :GoImport
" // GoFmt when saving a file
autocmd BufWritePost,FileWritePost *.go silent! :GoFmt
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab

" // [RUST]
autocmd FileType rust colorscheme fahrenheit
" // use rustfmt when saving
"autocmd BufWritePost,FileWritePost *.rs silent! :RustFmt
let g:rustfmt_on_save = 1
"let g:ale_rust_rustfmt_executable = 'rustfmt'
"let g:rustfmt_options = '--edition=2021'

" // [JSON]
autocmd FileType json set cuc cul
"autocmd FileType json let g:indentLine_char = '|'
"let g:vim_json_conceal=0

" // [C/C++] formatting
"autocmd FileType c ClangFormatAutoEnable
let g:clang_format#style_option = {
      \ "AccessModifierOffset": -4,
      \ "AllowShortIfStatementsOnASingleLine": "false",
      \ "AlwaysBreakTemplateDeclarations": "true",
      \ "Standard": "C++11",
      \}

" // ALE (IDE) CONFIGURATION
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
      \ 'c': ['clang-format'],
      \ 'cc': ['clang-format'],
      \ 'cpp': ['clang-format'],
      \ 'sh': ['shfmt'],
      \ 'ansible': ['ansible-lint'],
      \ 'dockerfile': ['dockerfile_lint'],
      \ 'elixir': ['credo'],
      \ 'erlang': ['erlfmt'],
      \ 'go' : ['gofmt'],
      \ 'java': ['clang-format'],
      \ 'kotlin': ['ktlint'],
      \ 'puppet': ['puppet-lint'],
      \}
      "\ 'rust': ['analyzer','cargo'],
"let g:ale_fixers = {
"      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
"      \ 'rust': ['rustfmt'],
"      \}
" // Fix when :w
"let g:ale_fix_on_save = 1


"-------------"
"-- PLUGINS --"
"-------------"
call plug#begin()
" // Asynchronous Lint Engine | Analysis (multiple language linter/checker)
Plug 'dense-analysis/ale'
" // Shell FMT (:Shfmt -i 4)
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
" // Golang FMT 
Plug 'darrikonn/vim-gofmt'
" // Puppet FMT 
Plug 'rodjek/vim-puppet'
" // HAproxy FMT 
Plug 'Joorem/vim-haproxy'
" // C FMT 
Plug 'rhysd/vim-clang-format'
" // Rust FMT 
Plug 'rust-lang/rust.vim'
Plug 'alx741/vim-rustfmt'
" // Python FMT (:Autopep8)
Plug 'tell-k/vim-autopep8'
" // Commentary (comment full block)
Plug 'tpope/vim-commentary'
" // Indent line (beautiful)
Plug 'Yggdroot/indentLine'
" // Terraform linter
Plug 'hashivim/vim-terraform'
" // THEMES / COLORS "
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'fcpg/vim-fahrenheit'
Plug 'fcpg/vim-orbital'
Plug 'fcpg/vim-farout'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tristen/superman'
Plug 'haishanh/night-owl.vim'
Plug 'lmarburger/vim-vividchalk'
Plug 'adonaldson/vim-tictoc'
Plug 'Rigellute/rigel'
Plug 'jsit/toast.vim'
Plug 'srcery-colors/srcery-vim'
call plug#end()

"------------"
"-- THEMES --"
"------------"
" GRUVBOX THEME
"colorscheme gruvbox
"set background=dark
"let g:gruvbox_contrast_dark = 'hard'

" GITHUB THEME
" let g:github_colors_soft = 1
" set background=dark
" let g:github_colors_block_diffmark = 0
" colorscheme github

" AYU THEME
let ayucolor="dark"
let background="black"
colorscheme ayu

