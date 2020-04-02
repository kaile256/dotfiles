scriptencoding utf-8
" From: appearance.toml
" Repo: Yggdroot/indentLine

let g:indentLine_faster = 1
let g:indentLine_conceallevel = 2

" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentline_color_term = 239
let g:indentline_color_term = 100
"let g:indentLine_char_list = ['|']

let g:indentLine_fileType = ['python']

" Note: the options to exclude causes a bulk of problems,
"   for example, defx cannot conceal its marker '**'.
" let g:indentLine_fileTypeExclude = ['vimwiki']
" let g:indentLine_bufTypeExclude = ['quickfix', 'terminal', 'nofile', 'help']
