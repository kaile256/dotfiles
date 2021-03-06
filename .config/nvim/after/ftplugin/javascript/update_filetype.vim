augroup myDetectReact
  au! BufWritePost *.{js,jsx,ts,tsx} call s:detect_react()
augroup END

if !exists('*s:detect_react')
  function! s:detect_react() abort
    if &ft =~# 'react' | return | endif

    " Note: built-in fileread() causes syntax failure; search() cannot get lines on
    " FileType-event yet.
    let fileread = 'cat'
    let lines_to_import = system(fileread .' '. expand('%:p') .'| head -n 50')
    let pats_to_be_react = [
          \ '^import React',
          \ '^import .* from .*next.*',
          \ ]
    let pat_to_be_react = join(pats_to_be_react, '\|')
    let is_react = lines_to_import =~# pat_to_be_react
    if is_react
      exe 'set ft='. &ft .'react'
    endif

    let &l:commentstring = '{/* %s */}'
  endfunction
endif

call s:detect_react()
