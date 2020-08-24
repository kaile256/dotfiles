" TOML: git.toml
" Repo: rhysd/conflict-marker.vim

hi! link ConflictMarkerOurs Type
hi! link ConflictMarkerTheirs Operator

augroup myConflictMarkerPost-overrideConfig
  let g:conflict_marker_enable_mappings = 0
  au BufReadPost,BufEnter,FocusGained,ColorScheme * call s:mappings_to_resolve()
  au BufReadPost,BufEnter,FocusGained,ColorScheme * call s:overwrite_foldmethod()
augroup END

function! s:mappings_to_resolve() abort
  if !conflict_marker#detect#markers() | return | endif

  " nmap <buffer> ]c <Plug>(conflict-marker-next-hunk)
  " nmap <buffer> [c <Plug>(conflict-marker-prev-hunk)

  nmap <buffer><expr> [c repmo#Key('<Plug>(conflict-marker-prev-hunk)', '<Plug>(conflict-marker-next-hunk)')
  nmap <buffer><expr> ]c repmo#Key('<Plug>(conflict-marker-next-hunk)', '<Plug>(conflict-marker-prev-hunk)')
  xmap <buffer><expr> [c repmo#Key('<Plug>(conflict-marker-prev-hunk)', '<Plug>(conflict-marker-next-hunk)')
  xmap <buffer><expr> ]c repmo#Key('<Plug>(conflict-marker-next-hunk)', '<Plug>(conflict-marker-prev-hunk)')

  " Excerpt: strategies to resolve a conflict
  " <<<<<<< HEAD
  " ourselves
  " =======
  " themselves
  " >>>>>>> deadbeef0123

  " Mnemonic: Get Above one
  nmap <buffer> ga <Plug>(conflict-marker-ourselves)
  " Mnemonic: Get Below one
  nmap <buffer> gb <Plug>(conflict-marker-themselves)
  " Mnemonic: Get Both
  " both: join literary both of 'ourselves' and 'themselves'
  nmap <buffer> gB <Plug>(conflict-marker-both)
  " Mnemonic: Get them Abolished
  " none: remove both of 'ourselves' and 'themselves'
  nmap <buffer> gA <Plug>(conflict-marker-none)
endfunction

function! s:adopt_current() abort
  let col = search('\S', 'n') - 1
  let syn = synIDattr(synID(line('.'), col, 0), 'name')

  if syn =~# 'ConflictMarker\(Ours\|Begin\)'
    ConflictMarkerOurselves
  elseif syn =~# 'ConflictMarker\(Theirs\|End\)'
    ConflictMarkerThemselves
  elseif syn ==# 'ConflictMarkerSeparator'
    ConflictMarkerBoth
  else
    echoerr 'Abort. This command only available within conflicted lines'
  endif
endfunction

function! s:discard_current() abort
  let col = search('\S', 'n') - 1
  let syn = synIDattr(synID(line('.'), col, 0), 'name')

  if syn =~# 'ConflictMarker\(Ours\|Begin\)'
    ConflictMarkerThemselves
  elseif syn =~# 'ConflictMarker\(Theirs\|End\)'
    ConflictMarkerOurselves
  elseif syn ==# 'ConflictMarkerSeparator'
    ConflictMarkerNone
  else
    echoerr 'Abort. This command only available within conflicted lines'
  endif
endfunction

function! s:overwrite_foldmethod() abort
  let foldexpr = 'ConflictMarkerFoldexpr(v:lnum)'

  if conflict_marker#detect#markers()
    if !exists('b:conflict_marker_overwriting_foldmethod')
      if &fde != 0
        let b:conflict_marker_save_foldexpr = &fde
      endif
      let b:conflict_marker_save_foldmethod = &fdm
    endif
    setlocal fdm=expr
    let &l:foldexpr = foldexpr
    let b:conflict_marker_overwriting_foldmethod = 1
    return
  endif

  if exists('b:conflict_marker_save_foldmethod')
    let &fdm = b:conflict_marker_save_foldmethod
    unlet b:conflict_marker_save_foldmethod
  endif

  if exists('b:conflict_marker_save_foldexpr')
    let &fde = b:conflict_marker_save_foldexpr
    unlet b:conflict_marker_save_foldexpr
  endif
endfunction

function! ConflictMarkerFoldexpr(lnum) abort
  if a:lnum == 1
    return '>1'
  endif

  let line = getline(a:lnum)
  let prev = getline(a:lnum - 1)
  let next = getline(a:lnum + 1)

  if get(g:, 'conflict_marker_fold_unfold_conflicted', 1)
    if next =~# g:conflict_marker_begin
      return '<1'
    elseif line =~# g:conflict_marker_separator
      return 0
    elseif prev =~# g:conflict_marker_end
      return '>1'
    endif
  else
    if next =~# g:conflict_marker_begin
      return '<1'
    elseif prev =~# g:conflict_marker_begin
      return '>1'
    elseif prev =~# g:conflict_marker_separator
      return '>1'
    elseif next =~# g:conflict_marker_separator
      return '<1'
    elseif next =~# g:conflict_marker_end
      return '<1'
    elseif prev =~# g:conflict_marker_end
      return '>1'
    endif
  endif

  return '='
endfunction
