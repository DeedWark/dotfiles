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
set termguicolors
" // Check No-Break Space (U+00A0 - 0xC2 0xA0 - <0xa0> - NBSP)
match Error /\%xA0/
" // Show all options when hittng tabs like ':colo <tab>'
set wildmenu
" // Allow clipboard to touch ass
set clipboard=unnamedplus

"••••••••••••"
"•• SEARCH ••"
"••••••••••••"
" // Highlight pattern searching
set hlsearch
" // Realtime pattern searching
set incsearch
" // REMAP - Press Space to turn off highlighting and clear any displayed pattern.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"••••••••••••••"
"•• SHORTCUT ••"
"••••••••••••••"
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

" // [PYTHON]
autocmd FileType python colorscheme gruvbox
" autocmd FileType python colorscheme farout

"••••••••••••••"
"•• [GOLANG] ••"
"••••••••••••••"
autocmd FileType go colorscheme spaceduck "gruvbox 
" // GoImports when saving a file (add imports modules automatically)
autocmd BufWritePost,FileWritePost *.go silent! :GoImport
" // GoFmt when saving a file
autocmd BufWritePost,FileWritePost *.go silent! :GoFmt
autocmd FileType go setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

" // [RUST]
autocmd FileType rust colorscheme srcery "fahrenheit
"autocmd FileType rust colorscheme PaperColor
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
" let g:ale_linters = {
"       \ 'c': ['clang-format'],
"       \ 'cc': ['clang-format'],
"       \ 'sh': ['shfmt'],
"       \ 'rust': ['analyzer'],
"       \}
      " \ 'rust': ['analyzer','cargo'],
"let g:ale_fixers = {
"      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
"      \ 'rust': ['rustfmt'],
"      \}
" // Fix when :w
"let g:ale_fix_on_save = 1

let g:indentLine_setConceal = 0

" // COC configuration

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" // END COC CONFIG

" let g:coc_global_extensions = ['coc-solargraph']

"•••••••••••••"
"•• PLUGINS ••"
"•••••••••••••"
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
Plug 'nvie/vim-flake8'
" // Commentary (comment full block)
Plug 'tpope/vim-commentary'
" // Indent line (beautiful)
Plug 'Yggdroot/indentLine'
" // Coc (Autocompletion like VScode)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
" Fuzzing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" // THEMES / COLORS "
Plug 'ayu-theme/ayu-vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'fcpg/vim-fahrenheit'
Plug 'fcpg/vim-orbital'
Plug 'fcpg/vim-farout'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'andreasvc/vim-256noir'
Plug 'srcery-colors/srcery-vim'
"" test
Plug 'wojciechkepka/vim-github-dark'
Plug 'glepnir/oceanic-material'
Plug 'fenetikm/falcon'
Plug 'pineapplegiant/spaceduck'
Plug 'sjl/badwolf'

""" NVIM
Plug 'preservim/nerdtree'
call plug#end()

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



""""" NVIM
" open NERDTree automatically
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",
    "\ "Modified"  : "#d9bf91",
    "\ "Renamed"   : "#51C9FC",
    "\ "Untracked" : "#FCE77C",
    "\ "Unmerged"  : "#FC51E6",
    "\ "Dirty"     : "#FFBD61",
    "\ "Clean"     : "#87939A",
    "\ "Ignored"   : "#808080"
    "\ }


let g:NERDTreeIgnore = ['^node_modules$']

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline_theme='ayu_light'
let g:airline#extensions#tabline#formatter = 'default'
" navegação entre os buffers
nnoremap <M-Right> :bn<cr>
nnoremap <M-Left> :bp<cr>
nnoremap <c-x> :bp \|bd #<cr>
set hidden
set history=5000
