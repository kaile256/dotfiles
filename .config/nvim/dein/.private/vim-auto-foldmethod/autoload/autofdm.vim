function! s:contains_foldmarker() abort
  return search('{{{\%[\d]', 'cwn')
endfunction

function! autofdm#update()
  " Note: add any guards in plugin/autofdm.vim for the advantage of autoload.

  let last_foldmethod = &foldmethod

  if &diff && &foldmethod !=# 'diff'
    setlocal foldmethod=diff

  elseif &foldmethod !=# 'marker' && s:contains_foldmarker()
    setlocal foldmethod=marker

  elseif &foldmethod !=# &g:fdm && &foldmethod ==# 'marker'
        \ && !s:contains_foldmarker()
    set fdm<

  elseif !empty(&foldexpr) && &foldmethod !=# 'expr'
    " FIXME: set foldmethod=expr reasonably
    "   !&foldexpr sets foldmethod=expr
    "   &foldexpr =~# '#\|\(^\u\).*)$' sets foldmethod=expr
    setlocal foldmethod=expr
  endif

  if last_foldmethod ==# &foldmethod | return | endif
  call s:update_undo_ftplugin()

  " For the time when foldmethod has changed.
  norm! zv
endfunction

function! s:update_undo_ftplugin()
  if &l:fdm == &g:fdm | return | endif

  if exists('b:undo_ftplugin')
    let b:undo_ftplugin .= ' | '
  else
    let b:undo_ftplugin = ''
  endif
  let b:undo_ftplugin .= 'setl fdm<'
endfunction

