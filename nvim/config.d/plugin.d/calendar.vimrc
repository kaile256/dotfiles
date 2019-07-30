"""" From: tool.toml
""""  Ref: defx.vimrc

let g:calendar_google_calendar = 1

"""" KEYMAP
nnoremap <a-q> <Plug>(calendar)

augroup Calendar
  au! FileType calendar s:calendar_map()
augroup END

function! s:calendar_map() abort
  """ Unmap for Other Mappings
  nunmap <buffer> <c-n>
  nunmap <buffer> <c-p>
  nunmap <buffer> <c-h>
  nunmap <buffer> <c-j>
  nunmap <buffer> <c-k>
  nunmap <buffer> <c-l>
  """ Visual Mode
   "" Alt to ESC
  vmap <buffer> <a-h> <Plug>(calendar_exit_visual)h
  vmap <buffer> <a-k> <Plug>(calendar_exit_visual)j
  vmap <buffer> <a-k> <Plug>(calendar_exit_visual)k
  vmap <buffer> <a-l> <Plug>(calendar_exit_visual)l
endfunction
