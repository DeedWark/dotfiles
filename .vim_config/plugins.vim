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
call plug#end()
