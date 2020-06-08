" From: ftplugin.vim

inoremap <buffer><expr> r
      \ (getline('.') =~# 'function!\&.*(.*)\(.*range\)\@!')
      \ && (getline('.')[col('.') - 2] ==# ' ')
      \ ? 'range'
      \ : 'r'

inoremap <buffer><expr> a
      \ (getline('.') =~# 'function!\&.*(.*)\(.*abort\)\@!')
      \ && (getline('.')[col('.') - 2] ==# ' ')
      \ ? 'abort'
      \ : 'a'

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
