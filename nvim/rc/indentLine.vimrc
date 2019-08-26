" From: appearance.toml

" Let; "{{{
let g:indentline_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:vim_json_syntax_conceal = 0
let g:indentLine_fileTypeExclude = ['help']

let g:indentLine_faster = 1
"}}}

augroup MyIndentLineAugroup "{{{
  au!
  "au BufLeave,TextChangedI        * if &l:cursorline == 1 | IndentLinesDisable
  "au Syntax,BufEnter,InsertLeave * if &ft != 'help' && &l:cursorline == 0 | IndentLinesEable
augroup END "}}}
