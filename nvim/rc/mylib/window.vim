
function! window#weed_out() abort "{{{1
  " Note: it's almost the same as smart_diffoff()
  let l:id = win_getid()

  windo
        \ if &bt ==# 'nofile'
        \ || &bt ==# 'nowrite'
        \ || &bt ==# 'quickfix'
        \ |  quit
        \ | endif

  for i in g:mylib_window_weed_windows
    windo
          \ if bufname('%') =~# i
          \ |  quit
          \ | endif
  endfor

  diffoff!
  if exists('b:fdm_before_diff')
    exe 'setl foldmethod='. b:fdm_before_diff
  endif

  call win_gotoid(l:id)

endfunction "}}}1
command! QuickClose :call window#weed_out()

function! window#harvest() abort "{{{1
  call window#weed_out()
  silent wincmd T
  " TODO:
  let t:window_extracted_window = win_getid()
endfunction "}}}1
command! WinExtract :call window#harvest()

function! window#floating() abort "{{{1
  " Ref: https://github.com/junegunn/fzf.vim/issues/664
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let width = float2nr(&columns - (&columns * 1 / 10))
  let height = &lines - 2
  let y = &lines - 10
  let x = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': y,
        \ 'col': x,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction "}}}1
