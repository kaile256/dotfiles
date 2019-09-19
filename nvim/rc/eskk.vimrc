scriptencoding utf-8
" From: insert.toml

set imdisable
let g:eskk#directory = g:data_home . '/eskk'
let g:eskk#backup_dictionary = g:data_home . '/eskk/backup'
if !isdirectory(g:eskk#backup_dictionary)
  exe '!mkdir -p' shellescape(expand(g:eskk#backup_dictionary))
endif
let g:eskk#select_cand_keys = 'abcdefg'
" if unique, confirm auto.
let g:eskk#kakutei_when_unique_candidate = 1
"let g:eskk#dictionary = {'encoding': 'utf-8', 'sorted': 0, 'path': expand(g:my_data . '/dict')}
"let g:eskk#initial_mode = 'ascii'
let g:eskk#start_completion_length = 2

"let g:eskk#no_default_mappings = 1 " useless
"let g:eskk#mapped_keys = "\<c-space>"
inoremap <c-j> <c-j>
cnoremap <c-j> <c-j>
" Note: Never map on <alt> for imap as <esc>
imap <c-space> <Plug>(eskk:toggle)
imap <c-8> <Plug>(eskk:save-dictionary)

cmap <silent> <c-space> <Plug>(eskk:toggle)
cmap <silent> <c-8> <c-u>call eskk#update_dictionary()<cr>


if execute('!uname -r') =~? 'Manjaro'
  "  " Experimental; for-loop {{{
  "  let s:skk_jisyo_list = [
  "        \ '/usr/share/skk-emoji-jisyo/SKK-JISYO.emoji.utf8'
  "        \ '/usr/share/skk/SKK-JISYO.L'
  "        \ ]
  "  for jisyo in s:skk_jisyo_list
  "    if filereadable(expand(jisyo))
  "      let g:eskk#large_dictionary = {'encoding': 'euc-jp', 'sorted': 1, 'path': expand(jisyo)}
  "    endif
  "  endfor "}}}
  if filereadable(expand('/usr/share/skk/SKK-JISYO.L'))
    let g:eskk#large_dictionary = {'encoding': 'euc-jp', 'sorted': 1, 'path': expand('/usr/share/skk/SKK-JISYO.L')}
  endif
endif

" Server; yaskkserv
" TODO: auto-start on i3.
"let g:eskk#server = {'host': 'localhost', 'port': 1178}

" Marker
let g:eskk#marker_henkan = '@'
let g:eskk#marker_henkan_select = '>>'
" Completion
let g:eskk#start_completion_length = 2
"" Completion; <TAB> to next selection
let g:eskk#tab_select_completion = v:true

let g:eskk#kakutei_when_unique_candidate = v:true

let g:eskk#egg_like_newline = v:true
let g:eskk#egg_like_newline_completion = v:true
let g:eskk#keep_state = v:false
let g:eskk#show_annotation = v:true
"autocmd MyAutoCmd User eskk-initialize-post EskkMap -remap jj <ESC>
