" From: init.vim

set diffopt=iwhite,iwhiteeol,iblank
set diffopt+=filler,internal
set diffopt+=vertical,indent-heuristic
set diffopt+=algorithm:histogram

augroup EnterDiffMode
  au!
  "au OptionSet * if &diff | setl wrap | endif " diffchar could cause error
  "au WinEnter,OptionSet *
  "      \ if &l:fdm !=# 'diff'
  "      \ |  let b:_fdm_before_diff = &l:fdm
  "      \ | endif
  function! s:diff_keymaps() abort "{{{
    " Put/Get only SELECTED lines.
    " Note: both do & dp on visual-mode makes
    "       a delay on simple d to delete selected area, therefore,
    "       let <a-d> a prefix in the sense of <esc> from visual- to normal-mode.
    xnoremap <silent><buffer> <a-d>p     :diffput<cr>
    xnoremap <silent><buffer> <a-d>o     :diffget<cr>
    xnoremap <silent><buffer> <a-d><a-p> :diffput<cr>
    xnoremap <silent><buffer> <a-d><a-o> :diffget<cr>
  endfunction "}}}
  au WinEnter * if &diff | call s:diff_keymaps() | endif
augroup END

augroup LeaveDiffMode
  au!
  " Turn off diff mode, without any other windows.
  au WinEnter *
        \ if (winnr('$') == 1)
        \ && getbufvar(winbufnr('.'), '&diff') == 1
        \ |  diffoff!
        \ | endif
augroup END

if exists('#DelAugLaterLazyDiff')
  augroup! DelAugLaterLazyDiff
endif
