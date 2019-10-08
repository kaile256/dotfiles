function! window#weed_out() abort "{{{1
  " Note: it's almost the same as smart_diffoff()
  let l:id = win_getid()

  windo
        \ if &bt ==# 'nofile'
        \ || &bt ==# 'nowrite'
        \ || &bt ==# 'quickfix'
        \ |  quit
        \ | endif

  for i in g:mylib_weed_windows
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
function! window#extract() abort "{{{1
  call window#weed_out()
  silent wincmd T
  let t:extracted_window = win_getid()
endfunction "}}}1
command! QuickClose :<c-u>call window#weed_out()
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
command! WinExtract :<c-u>call window#extract()

function! keymap#generater(prefix, cmd, opt) abort
  " TODO: simplify w/o list, but only dict.
  let l:split_dict = {
        \ 'e': 'e',
        \ 'sp': 's',
        \ 'vs': 'v',
        \ 'tabe': 't',
        \ }
  let l:split_list = ['e', 'sp', 'vs', 'tabe']
  let l:path_dict = {
        \ '~'           : 'h',
        \ g:nvim_home   : 'v',
        \ g:cache_home  : 'c',
        \ g:config_home : 'f',
        \ '/'           : 'r',
        \ ''            : '.',
        \ '%:p:h'       : 'w',
        \ }
  let l:path_list = ['', '~', '/', g:cache_home, g:config_home, g:nvim_home]
  for l:key in l:split_list
    for l:path in l:path_list
      exe 'nnoremap <silent> '.
            \ a:prefix . l:path_dict[l:path] . l:split_dict[l:key]
            \ .' :<c-u>cd '. l:path .'<bar>'. l:key .'<bar>' a:cmd .' '. a:opt .'<cr>'
    endfor
  endfor
endfunction
