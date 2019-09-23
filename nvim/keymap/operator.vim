" TODO: inc/dec for hex color on guifg/bg
onoremap <silent> gv :<c-u>norm! gv<cr>
xnoremap zo zogv
xnoremap zO zOgv
xnoremap zc zcgv
xnoremap zC zCgv
xnoremap zr zrgv
xnoremap zR zRgv
xnoremap zm zmgv
xnoremap zM zMgv
xnoremap <c-x> <c-x>gv
xnoremap <c-a> <c-x>gv
xnoremap <silent> = =:norm! gv<cr>
xnoremap > >gv
" Fail to work
xnoremap < <:norm! gv<cr>

" Sloth; Text Object
function! s:reset_textobj(prefix) abort
  let l:operator = v:operator
  if prefix ==# 'i'
    norm <esc> `l:operator` i
  elseif prefix ==# 'a'
    norm <esc> `l:operator` a
  endif
endfunction
onoremap <expr> a '<esc>' . v:operator . 'a'
onoremap <expr> i '<esc>' . v:operator . 'i'
xnoremap <expr> a '<esc>' . v:operator . 'a'
xnoremap <expr> i '<esc>' . v:operator . 'i'

" Jump to next/prev space
" TODO: Ignore difference of line's height.
nnoremap g<space> f<space>
nnoremap <s-space> F<space>
onoremap <space>
      \ (v:operator == 'd')? m`f<space>"_x``
      \ (v:operator == 'c')? f<space>"_s
onoremap <s-space>
      \ (v:operator == 'd')? m`F<space>"_x``
      \ (v:operator == 'c')? F<space>"_s

" TODO: Make I/A on linewise visual mode as blockwise.
"xnoremap <expr><silent> I (v:event.regtype ==# 'V')? ':norm <c-v>0I<cr>': 'I'
"xnoremap <expr><silent> A (v:event.regtype ==# 'V')? ':norm <c-v>0A<cr>': 'A'
"xnoremap <silent> I if v:event.regtype ==# 'V' <bar> :norm <c-v>0I<cr> <bar> endif<cr>
"xnoremap <silent> A if v:event.regtype ==# 'V' <bar> :norm <c-v>0A<cr> <bar> endif<cr>
onoremap <expr><silent> v (v:operator != 'v')? ':norm v<cr>': 'v'
onoremap <expr><silent> d (v:operator != 'd')? ':norm d<cr>': 'd'
onoremap <expr><silent> c (v:operator != 'c')? ':norm c<cr>': 'c'
onoremap <expr><silent> y (v:operator != 'y')? ':norm y<cr>': 'y'

onoremap <silent> V :norm V<cr>
onoremap <silent> D :norm D<cr>
onoremap <silent> C :norm C<cr>
onoremap <silent> Y :norm y$<cr>

vnoremap <a-a> <esc>a
vnoremap <a-i> <esc>i
