" From: ftplugin.vim

silent! setlocal fo-=r " Insert comment leader by \<CR> in Normal mode
silent! setlocal fo-=o " Insert comment leader by o/O in Normal mode

function! s:fold_up_vimscript() abort "{{{
  if &readonly && !&modifiable | return | endif

  if mode() =~? 'v'
    silent *g/function!/v/"{{{/norm! A "{{{
    silent *g/endfunction/v/"}}}/norm! A "}}}
    silent *g/augroup/v/END/v/"{{{/norm! A "{{{
    silent *g/augroup/g/END/v/"}}}/norm! A "}}}
  else
    silent g/function!/v/"{{{/norm! A "{{{
    silent g/endfunction/v/"}}}/norm! A "}}}
    silent g/augroup/v/END/v/"{{{/norm! A "{{{
    silent g/augroup/g/END/v/"}}}/norm! A "}}}
  endif
endfunction "}}}

command! -range -bar FoldUpVimscript call s:fold_up_vimscript()
