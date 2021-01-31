if b:help_readonly | finish | endif

function! s:align_helptags() abort range
  const pos_subtitle = 80
  const pos_helptag  = 79

  " const pat_subtitile = '^\s*\u\+\s*\*\S\+\*$'
  const pat_helptag   = '^\%(\u\+\)\@<!.*\s*\*\S\+\*$'

  const save_view = winsaveview()

  " TODO: Align helptags which follow keywords/subtitles with <TAB>s, too.
  exe 'keeppatterns' a:firstline ',' a:lastline 'g/'. pat_helptag   .'/right' pos_helptag
  " exe 'keeppatterns' a:firstline ',' a:lastline 'g/'. pat_subtitile .'/right' pos_subtitle

  call winrestview(save_view)
endfunction

nnoremap <buffer><nowait><silent> == :<C-u>2,$ call <SID>align_helptags()<CR>
xnoremap <buffer><nowait><silent> =  :<C-u>*   call <SID>align_helptags()<CR>

