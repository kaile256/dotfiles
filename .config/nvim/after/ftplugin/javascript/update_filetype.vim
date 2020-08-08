
if &ft =~# 'react' | finish | endif

" Note: built-in fileread() causes syntax failure; search() cannot get lines on
" FileType-event yet.
let fileread = 'cat'
let lines_to_import = system(fileread .' '. expand('%:p') .'| head -n 50')
let is_react = lines_to_import =~# '^import React'
if is_react
  exe 'set ft='. &ft .'react'
endif
