"""" From: tool.toml
""""  Ref: defx.vimrc

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

"""" KEYMAP
nnoremap <a-q> :Calendar<CR>

augroup Calendar
  au! FileType calendar call s:calendar_map()
augroup END

"""" DEFINITION
function! s:calendar_map() abort
  """ Open Config (this file)
  nnoremap <buffer><silent> <space>e
        \ :e ~/.config/nvim/config.d/plugin.d/calendar.vimrc<cr>
  nnoremap <buffer><silent> <space>v
        \ :vs ~/.config/nvim/config.d/plugin.d/calendar.vimrc<cr>
  nnoremap <buffer><silent> <space>s
        \ :sp ~/.config/nvim/config.d/plugin.d/calendar.vimrc<cr>
  nnoremap <buffer><silent> <space>t
        \ :tabe ~/.config/nvim/config.d/plugin.d/calendar.vimrc<cr>

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
