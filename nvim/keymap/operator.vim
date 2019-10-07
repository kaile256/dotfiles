function! s:operate_line(direction) abort "{{{1
  let l:operator = v:operator

  "if execute('omap p') =~# 'operator#operate_line'
  if execute('omap p') =~# '<Plug>(move-line-' "{{{2
    if l:operator ==# 'd' && &diff
      diffput
    endif
  endif "}}}2

  if a:direction ==# 'downward' "{{{2
    if l:operator ==# 'y'
      copy .
    elseif l:operator ==# 'c' || l:operator ==# 'd'
      move +1
    endif
    "}}}2

  elseif a:direction ==# 'upward' "{{{2
    if l:operator ==# 'y'
      copy -1
    elseif l:operator ==# 'c' || l:operator ==# 'd'
      move -2
    endif
  endif "}}}2
endfunction "}}}1

onoremap <silent> <Plug>(move-line-downward) <esc>:call <SID>operate_line('downward')<cr>
onoremap <silent> <Plug>(move-line-upward)   <esc>:call <SID>operate_line('upward')<cr>
omap p <Plug>(move-line-downward)
omap P <Plug>(move-line-upward)

"onoremap <expr>p operator#operate_line('downward')
"onoremap <expr>p operator#operate_line('upward')

"nnoremap <silent> yp :copy .<cr>
"nnoremap <silent> yP :copy -1<cr>
"nnoremap <silent> cp :move +1<cr>
"nnoremap <silent> cP :move -2<cr>
