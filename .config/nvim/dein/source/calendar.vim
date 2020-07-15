" TOML: web.toml
" Repo: itchyny/calendar.vim

let g:calendar_google_task = 1
let g:calendar_google_calendar = 1

let g:calendar_updatetime = 1000 " (ms)

if exists('#myCalendarPost') | au! myCalendarPost
endif
augroup myCalendarPost
  au FileType calendar call s:calendar_keymap()
augroup END

function! s:calendar_keymap() abort
  " Unmap for Other Mappings
  nunmap <buffer> <c-n>
  nunmap <buffer> <c-p>
  nunmap <buffer> <c-h>
  nunmap <buffer> <c-j>
  nunmap <buffer> <c-k>
  nunmap <buffer> <c-l>

  " TODO: Create replace commands, <Plug>(calendar_view_week),
  " <Plug>(calendar_view_days), etc.
  " nnoremap <Plug>(calendar_view_week) :<C-u>Calendar -view=week<CR>
  " nmap gw <Plug>(calendar_view_week)
  " nmap <buffer> < <Plug>(calendar_view_left)
  " nmap <buffer> > <Plug>(calendar_view_right)
endfunction
