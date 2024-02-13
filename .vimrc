" INIT MULTIPLE CONFIGURATION FILES "
for f in split(glob('~/.vim_config/*.vim'), '\n')
  exe 'source' f
endfor

"••••••••••••"
"•• BASICS ••"
"••••••••••••"
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
" // Enable beautiful colors
set termguicolors
" // Check No-Break Space (U+00A0 - 0xC2 0xA0 - <0xa0> - NBSP)
match Error /\%xA0/
" // Allow saved clipboard
" set clipboard=unnamedplus

"••••••••••••"
"•• SEARCH ••"
"••••••••••••"
" // Show all options when hitting tabs like ':colo <tab>'
set wildmenu
" // Highlight pattern searching
set hlsearch
" // Realtime pattern searching
set incsearch
" // REMAP - Press Space to turn off highlighting and clear any displayed pattern.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"••••••••••••••"
"•• SHORTCUT ••"
"••••••••••••••"
" // When you were not sudo and what you did is fucked up
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

" // [PYTHON]
autocmd FileType python colorscheme gruvbox

"--------------"
"-- [GOLANG] --"
"--------------"
autocmd FileType go colorscheme spaceduck "gruvbox 
" // GoImports when saving a file (add imports modules automatically)
autocmd BufWritePost,FileWritePost *.go silent! :GoImport
" // GoFmt when saving a file
autocmd BufWritePost,FileWritePost *.go silent! :GoFmt
autocmd FileType go setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

" // [RUST]
autocmd FileType rust colorscheme farout "srcery
" // use rustfmt when saving
"autocmd BufWritePost,FileWritePost *.rs silent! :RustFmt
let g:rustfmt_on_save = 1
"let g:ale_rust_rustfmt_executable = 'rustfmt'
"let g:rustfmt_options = '--edition=2021'

" // [JSON]
autocmd FileType json set cuc cul
"autocmd FileType json let g:indentLine_char = '|'
"let g:vim_json_conceal=0

" // [EXLIXIR]
autocmd FileType elixir colorscheme zaibatsu

" // [C/C++] formatting
"autocmd FileType c ClangFormatAutoEnable
" let g:clang_format#style_option = {
"       \ "AccessModifierOffset": -4,
"       \ "AllowShortIfStatementsOnASingleLine": "false",
"       \ "AlwaysBreakTemplateDeclarations": "true",
"       \ "Standard": "C++11",
"       \}


" let g:indentLine_setConceal = 0

"••••••••••••"
"•• THEMES ••"
"••••••••••••"
" GRUVBOX THEME
" colorscheme retrobox
colorscheme gruvbox
"colorscheme gruvbox
set background=dark

" GITHUB THEME
" let g:github_colors_soft = 1
" set background=dark
" let g:github_colors_block_diffmark = 0
" colorscheme github

" AYU THEME
" let ayucolor="light"
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
