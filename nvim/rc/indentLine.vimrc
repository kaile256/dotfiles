scriptencoding utf-8
" From: appearance.toml
" Repo: Yggdroot/indentLine

"let g:indentline_color_term = 239
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"set concealcursor= " re-set concealcursor=inc, auto
let g:vim_json_syntax_conceal = 0 " useless if concealcursor is set.

let g:indentLine_fileTypeExclude = ['help', 'vimwiki', 'defx']
let g:indentLine_bufTypeExclude = ['quickfix', 'terminal']

let g:indentLine_faster = 1

augroup MyIndentLineAugroup
  au!
  function! s:indentline_disable() "{{{
    if &l:modifiable
      if join(g:indentLine_fileTypeExclude) !~# &ft || join(g:indentLine_bufTypeExclude) !~# &bt
        IndentLinesDisable
      endif
    endif
  endfunction "}}}
  au WinLeave,BufWinLeave,InsertEnter * call <SID>indentline_disable()
  "au BufLeave,WinLeave,BufWinLeave,InsertEnter * IndentLinesDisable
  function! s:indentline_enable() "{{{
    if &l:modifiable
      if join(g:indentLine_fileTypeExclude) !~# &ft || join(g:indentLine_bufTypeExclude) !~# &bt
        IndentLinesEnable
      endif
    endif
  endfunction "}}}
  au WinEnter,BufWinEnter,InsertLeave * call <SID>indentline_enable()
  "au BufEnter,WinEnter,BufWinEnter,InsertLeave * IndentLinesEnable
  " TODO: always setl conceallevel=0 on json.
  au InsertEnter *.json if &cole != 0 || &cocu !=# '' | setl conceallevel=0 concealcursor=
augroup END
