" From: external.toml
"  Ref: defx.vimrc

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

command! Cal :Calendar

augroup CalendarCallMyFunc
  au! FileType calendar call s:calendar_keymap()
augroup END

function! s:calendar_keymap() abort
  " Unmap for Other Mappings
  nunmap <buffer> <c-n>
  nunmap <buffer> <c-p>
  nunmap <buffer> <c-h>
  nunmap <buffer> <c-j>
  nunmap <buffer> <c-k>
  nunmap <buffer> <c-l>
endfunction
