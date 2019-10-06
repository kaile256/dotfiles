function! operator#operate_line(direction) abort "{{{1
  if v:count
    let l:count = v:count
  else
    let l:count = 0
  endif
  if a:direction ==# 'downward' "{{{2
    if v:operator ==# 'y'
      copy l:count +1
    elseif v:operator ==# 'd' && &diff
      diffput
    elseif v:operator ==# 'c' && v:operator ==# 'd'
      move l:count +1
    endif "}}}2
  elseif a:direction ==# 'upward' "{{{2
    if v:operator ==# 'y'
      copy l:count -2
    elseif v:operator ==# 'c' && v:operator ==# 'd'
      move l:count -2
    endif
  endif "}}}2
endfunction "}}}1

onoremap <Plug>(copy-line-downward) <esc>:call operator#operate_line('downward')<cr>
onoremap <Plug>(move-line-downward) <esc>:call operator#operate_line('downward')<cr>
onoremap <Plug>(copy-line-upward)   <esc>:call operator#operate_line('upward')<cr>
onoremap <Plug>(move-line-upward)   <esc>:call operator#operate_line('upward')<cr>

omap <expr> p
      \ (v:operator ==# 'y')? '<Plug>(copy-line-downward)':
      \ (v:operator ==# 'd')?
      \    (&diff)? ':diffput<cr>':
      \  '<Plug>(move-line-downward)':
      \ (v:operator ==# 'c')? '<Plug>(move-line-downward)':
      \ 'p'

omap <expr> P
      \ (v:operator ==# 'y')? '<Plug>(copy-line-upward)':
      \ (v:operator ==# 'd')? '<Plug>(move-line-upward)':
      \ (v:operator ==# 'c')? '<Plug>(move-line-upward)':
      \ 'P'
