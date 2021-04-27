" Note: (MAYBE WRONG)
"   leave `*`, instead of `-`, for unorder list style at first. Though all
"   the `*` for list shall be replaced with `-` by prettier, the lint will say
"   nothing after the replacement.
"   Ref: markdownlint MD004 ul-style

function! s:start_new_item(o) abort
  const o = a:o
  const line = getline('.')
  const prev = getline(line('.') - 1)

  const pat_list = '^\s*- '
  const pat_task = '^\s*- \[[ x]\] '
  const Add_list = o .'- '
  const Add_task = o .'- [ ] '

  if o ==# 'O' && prev !~# pat_list && prev !~# pat_task
    return o
  endif

  return    line =~# pat_task ? Add_task
        \ : line =~# pat_list ? Add_list
        \ : o
endfunction
nnoremap <buffer><expr> o <SID>start_new_item('o')
nnoremap <buffer><expr> O <SID>start_new_item('O')

nnoremap <buffer><silent><buffer> <SID>(header-increment) :<C-u>silent! undojoin<CR>I#<Esc>
nnoremap <buffer><silent><buffer> <SID>(header-decrement) :<C-u>silent! undojoin<CR>^"_x
nnoremap <buffer><silent><buffer> <SID>(task-done)   :<C-u>silent! undojoin <bar> keeppattern s/\[ ]/\[x]/e<CR>
nnoremap <buffer><silent><buffer> <SID>(task-undone) :<C-u>silent! undojoin <bar> keeppattern s/\[\a]\c/\[ ]/e<CR>

" Mnemonic: Further / Fill with mark
nmap <expr><silent><buffer> zf
      \ (getline('.') =~# '^\s*#\+ \S')
      \ ? '<SID>(header-increment)'
      \ : '<SID>(task-done)'
" Mnemonic: Decrease / Delete the mark
nmap <expr><silent><buffer> zd
      \ (getline('.') =~# '^\s*#\+\s\S')
      \ ? '<SID>(header-decrement)'
      \ : '<SID>(task-undone)'

