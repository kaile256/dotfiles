function! my#floating_window() abort "{{{1
  " Ref: https://github.com/junegunn/fzf.vim/issues/664

  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let width = float2nr(&columns * 95 / 100)
  let height = &lines - 2
  let y = &lines - 10
  let x = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'width': width,
        \ 'height': height,
        \ 'col': x,
        \ 'row': y,
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
