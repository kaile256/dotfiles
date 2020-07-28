if &modifiable && !&readonly | finish | endif

if index(g:sensible#gf#preview_filetypes, fnamemodify(expand('<sfile>'), ':t:r'))
  nnoremap <buffer><silent><nowait> p :<C-u>call sensible#gf#_Gopen()<CR>
endif
