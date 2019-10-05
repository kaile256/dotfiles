" From: filetype.vim

set diffopt=iwhite,vertical

augroup EnterDiffMode "{{{1
  au!
  au WinEnter,OptionSet *
        \ if &l:fdm !=# 'diff'
        \ |  let b:fdm_before_diff = &l:fdm
        \ | endif

  "au WinEnter * if &l:diff | windo setl wrap | endif
  function! s:smart_diffoff() abort "{{{2
    windo
          \ if &bt ==# 'nofile'
          \ || &bt ==# 'nowrite'
          \ || &bt ==# 'quickfix'
          \ || bufname('%') =~# 'fugitive:\/\/'
          \ |  quit
          \ | endif
    diffoff!
    wincmd p
    silent wincmd T
    exe 'setl foldmethod='. b:fdm_before_diff
  endfunction "}}}2
  function! diff#maps() abort "{{{2

    " Put/Get only SELECTED lines.
    " Note: both do & dp on visual-mode makes
    "       a delay on simple d to delete selected area, therefore,
    "       let <a-d> a prefix in the sense of <esc> from visual- to normal-mode.
    xnoremap <silent><buffer> <a-d>p     :diffput<cr>
    xnoremap <silent><buffer> <a-d>o     :diffget<cr>
    xnoremap <silent><buffer> <a-d><a-p> :diffput<cr>
    xnoremap <silent><buffer> <a-d><a-o> :diffget<cr>

    command! -bar SmartDiffoff :call <SID>smart_diffoff()
    " all the below call smart_diffoff().
    nnoremap <silent><buffer> <c-w>o     :SmartDiffoff<cr>
    nnoremap <silent><buffer> <c-w><a-o> :SmartDiffoff<cr>
    onoremap <silent><buffer><expr> q
          \ (v:operator ==# 'd')? '<esc>:SmartDiffoff<cr>': 'q'
  endfunction "}}}2
  au WinEnter * if &l:diff | call diff#maps() | endif
augroup END

augroup LeaveDiffMode "{{{1
  au!
  " Turn off diff mode, without any other windows.
  au WinEnter *
        \ if (winnr('$') == 1)
        \ && (getbufvar(winbufnr('.'), '&diff')) == 1 |
        \     diffoff! |
        \ endif
augroup END

