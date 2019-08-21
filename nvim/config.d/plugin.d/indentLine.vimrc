"""" From: appearance.toml

" IndentLine; Let "{{{
let g:indentline_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:vim_json_syntax_conceal = 0
let g:indentLine_fileTypeExclude = ['help']

let g:indentLine_faster = 1
"}}}

" IndentLine; Augroup {{{
augroup MyIndentLineAugroup "{{{
  au!
  au WinEnter * if &ft != 'help' | IndentLinesEnable | endif
  au WinLeave * IndentLinesDisable
augroup END "}}}
