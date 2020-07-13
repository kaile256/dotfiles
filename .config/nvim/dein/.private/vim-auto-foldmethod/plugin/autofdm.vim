augroup autofdm
  au!
  au BufWinEnter * call s:update_foldmethod()
augroup END

function! s:update_foldmethod()
  if !&foldenable | return | endif
  if !&modifiable | return | endif

  if &foldmethod =~# 'diff\|expr' | return | endif

  let last_foldmethod = &foldmethod

  if &diff && &foldmethod !=# 'diff'
    setlocal foldmethod=diff

  elseif &foldexpr =~# '\(#\)\|\(^\u\).*)$' && &foldmethod !=# 'expr'
    " FIXME: set foldmethod=expr reasonably
    "   !&foldexpr sets foldmethod=expr
    "   &foldexpr =~# '#\|\(^\u\).*)$' sets foldmethod=expr
    setlocal foldmethod=expr

  elseif &foldmethod !=# 'marker' && search('{{{\%[\d]$', 'cwn')
    setlocal foldmethod=marker

  elseif &foldmethod !=# &g:fdm && &foldmethod ==# 'marker'
        \ && !search('{{{\%[\d]', 'cwn')
    set fdm<
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
