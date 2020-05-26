" From: init.vim

" diff set foldcolumn=1
set foldcolumn=0
setl nowinfixwidth nowinfixheight

"if winnr() == 1
"  setl nonumber
"endif

if get(g:, 'loaded_lazy_diff', 0) | finish | endif
let g:loaded_lazy_diff = 1

set diffopt=
"set diffopt=iwhite,iwhiteeol,iblank
set diffopt+=filler,internal
set diffopt+=vertical,indent-heuristic
set diffopt+=algorithm:histogram

augroup myDiffLazy
  if exists('#myDiffLazy')
    au! myDiffLazy
  endif
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
  " Turn off diff mode, without any other windows.
  au WinEnter *
        \ if (winnr('$') == 1)
        \ && getbufvar(winbufnr('.'), '&diff') == 1
        \ |   diffoff!
        \ | endif
augroup END

" augroup RemoveIrritativeHead
"   au!
"   au TextYankPost *{d,D}iff* call s:trim_head()
"   " au TextYankPost *diff*,*Diff* call s:trim_head()
" augroup END

" function! s:trim_head() abort
"   let regname = v:event.regname
"   if empty(regname)
"     " FIXME: care for blackhole-register(_)
"     let regname = '"'
"   endif
"   let pat = '\(^\|\n\)\zs\s*[-+]'
"   let @{regnamem} = substitute(regname, pat, '', 'ge')
" endfunction
