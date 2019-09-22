"" From: init.vim
""  Ref: showmarks.vimrc
"
"" Mark; Let {{{
"if !exists('b:mark_inc_number')
"  let b:mark_inc_upper = '0123456789'
"endif
"
"if !exists('b:mark_inc_lower')
"  let b:mark_inc_lower = 'abcdefghijklmnopqrstuvwxyz'
"endif
"
"if !exists('b:mark_inc_upper')
"  let b:mark_inc_upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
"endif
""}}}
"
"" Mark; Function! {{{
"
"function! s:AutoIncMarkNumber() "{{{
"  if !exists('b:last_mark_number')
"    let b:last_mark_lower = 0
"  else
"    let b:last_mark_lower = (b:last_number + 1) % len(b:mark_inc_number)
"  endif
"  silent execute 'mark' b:mark_inc_number[b:last_mark_number]
"  echo  'marked' b:mark_inc_number[b:last_mark_number]
"endfunction "}}}
"
"function! s:AutoIncMarkLower() "{{{
"  if !exists('b:last_mark_lower')
"    let b:last_mark_lower = 0
"  else
"    let b:last_mark_lower = (b:last_lower + 1) % len(b:mark_inc_lower)
"  endif
"  silent execute 'mark' b:mark_inc_lower[b:last_mark_lower]
"  echo  'marked' b:mark_inc_lower[b:last_mark_lower]
"endfunction "}}}
"
"function! s:AutoIncMarkUpper() "{{{
"  if !exists('b:last_mark_upper')
"    let b:last_mark_upper = 0
"  else
"    let b:last_mark_upper = (b:last_upper + 1) % len(b:mark_inc_upper)
"  endif
"  silent execute 'mark' b:mark_inc_upper[b:last_mark_upper]
"  echo  'marked' b:mark_inc_upper[b:last_mark_upper]
"endfunction "}}}
""}}}
"
"" Mark; Keymap {{{
"
"nnoremap <silent> mm       :<c-u>call <SID>AutoIncMarkNumber()<cr>
"nnoremap <silent> m<space> :<c-u>call <SID>AutoIncMarkUpper()<cr>
"nnoremap <silent> <space>m :<c-u>call <SID>AutoIncMarkUpper()<cr>
""}}}
"
"" Mark; Augroup {{{
""augroup RememberLastCursor
""  " cause ERROR on defx.
""  au!
""  au BufLeave * exe "normal mp"
""  au BufLeave * exe "normal mP"
""augroup END
""augroup MarkOnBufLeave
""  au! BufLeave * call <SID>AutoIncMarkUpper()
""augroup END
""}}}
