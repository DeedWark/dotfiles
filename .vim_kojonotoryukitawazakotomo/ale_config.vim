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
