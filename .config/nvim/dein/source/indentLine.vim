scriptencoding utf-8
" From: appearance.toml
" Repo: Yggdroot/indentLine

let g:indentLine_faster = 1
let g:indentLine_conceallevel = 0

let g:indentLine_showFirstIndentLevel = 1

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentline_color_term = 239
" let g:indentLine_color_gui

let g:indentLine_fileType = ['python', 'json']

" Note: the options to exclude causes a bulk of problems,
"   for example, defx cannot conceal its marker '**'.
" let g:indentLine_fileTypeExclude = ['vimwiki']
" let g:indentLine_bufTypeExclude = ['quickfix', 'terminal', 'nofile', 'help']
