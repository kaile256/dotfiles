scriptencoding utf-8
" From: appearance.toml

"let g:indentline_color_term = 239
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:vim_json_syntax_conceal = 0

let g:indentLine_fileTypeExclude = ['help', 'vimwiki']
let g:indentLine_bufTypeExclude = ['quickfix', 'terminal']

let g:indentLine_faster = 1

augroup MyIndentLineAugroup
  au!
  au BufLeave,CursorMovedI * if &l:cursorline == 0 | IndentLinesDisable
  function! s:indentline_exculsive_enable() "{{{
    if &modifiable
      if &ft !~# join(g:indentLine_fileTypeExclude) || join(g:indentLine_bufTypeExclude)
        IndentLinesEnable
      endif
    endif
  endfunction "}}}
  au CursorMoved * if &l:cursorline == 0 | call <SID>indentline_exculsive_enable()
  au BufEnter    * if &l:cursorline == 1 | call <SID>indentline_exculsive_enable()
augroup END
