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
  " TODO: restore all the previous mappings
  if !conflict_marker#detect#markers()
    silent! nunmap <buffer> [c
    silent! nunmap <buffer> ]c
    silent! xunmap <buffer> [c
    silent! xunmap <buffer> ]c
    return
  endif

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

  nmap <buffer> ga <Plug>(conflict-marker-ourselves)
  " Mnemonic: Get Below one
  nmap <buffer> gb <Plug>(conflict-marker-themselves)

  nnoremap <silent> <Plug>(conflict-marker-put-current)
        \ :<C-u>call <SID>adopt_ourselves_or_themselves(0)<CR>
  nnoremap <silent> <Plug>(conflict-marker-obtain-the-other)
        \ :<C-u>call <SID>adopt_ourselves_or_themselves(1)<CR>
  nmap <buffer> do <Plug>(conflict-marker-obtain-the-other)
  nmap <buffer> dp <Plug>(conflict-marker-put-current)
endfunction

function! s:adopt_ourselves_or_themselves(reverse) abort
  let col_forward  = searchpos('\S', 'n')[1] - 1
  let col_backward = searchpos('\S', 'bn')[1] - 1

  for col in [col_forward, col_backward]
    let syn = synIDattr(synID(line('.'), col, 0), 'name')

    if syn =~# 'ConflictMarker\(Ours\|Begin\)'
      exe a:reverse
            \ ? 'ConflictMarkerThemselves'
            \ : 'ConflictMarkerOurselves'
    elseif syn =~# 'ConflictMarker\(Theirs\|End\)'
      exe a:reverse
            \ ? 'ConflictMarkerOurselves'
            \ : 'ConflictMarkerThemselves'
    elseif syn ==# 'ConflictMarkerSeparator'
      exe a:reverse
            \ ? 'ConflictMarkerNone'
            \ : 'ConflictMarkerBoth'
    endif
  endfor

  echoerr 'Abort. This command only available within conflicted lines'
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
