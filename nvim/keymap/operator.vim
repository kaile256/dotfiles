augroup TellMeOperatorInfo
  au!
  au TextYankPost * call <SID>tellme_operator_info()
  function! s:tellme_operator_info()
    " Excerpt of Help {{{2
    " v:event.operator: the operator's name in initial
    " string(v:event.regcontents): the lines of the contents that the register got in list.
    " v:event.regname: the register just used if it's NOT the 'unnamed' register.
    " v:event.regtype: register is now specified (:help getregtype())
    " Assign to the values {{{0
    " Assign to l:args for :echo "{{{1
    " Assign to l:operated which is operated "{{{2
    if v:event.operator ==# 'y'
      let l:operated = 'Yanked'
    elseif v:event.operator ==# 'd'
      let l:operated = 'Deleted'
    elseif v:event.operator ==# 'c'
      let l:operated = 'Cut'
    elseif v:event.operator ==# ''
      let l:operated = 'Done'
    else
      let l:operated = v:event.operator
    endif
    "}}}
    let l:contents = string(v:event.regcontents)
    let l:regname = (v:event.regname ==# '')? '"' : v:event.regname
    "if v:event.regname ==# '_'
    "  let l:regname = '_'
    "endif
    let l:at_which = ' @'. l:regname
    " Main: :echo info {{{1
    if v:event.regtype ==# 'v'
      echomsg ' '. l:operated . l:at_which .' in Characterwise: ' . l:contents
    elseif v:event.regtype ==# 'V'
      echomsg ' '. l:operated . l:at_which .' in Line: ' . l:contents
    elseif v:event.regtype =~# ''
      echomsg ' '. l:operated . l:at_which .' in Block: ' . l:contents
    else
      echomsg ' '. l:operated . l:at_which .' in an Unknown way: ' . l:contents
    endif
  endfunction
  "}}}
augroup END

" on Terminal mode "{{{1
tnoremap <a-y> <c-\><c-n>y
tnoremap <a-c> <c-\><c-n>c
"}}}

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
" TODO: Make v_< work as I expect.
"xnoremap < <Cmd>norm! <gv

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

" Sloth; Prefix of Text Object
"function! s:reset_prefix_textobj(prefix) abort
"  let l:operator = v:operator
"  if prefix ==# 'i'
"    exe 'norm <esc>' . l:operator . 'i'
"  elseif prefix ==# 'a'
"    norm <esc> `l:operator`
"  endif
"endfunction
"onoremap  i <Cmd>call <SID>reset_prefix_textobj('i')<cr>
"xnoremap  i <Cmd>call <SID>reset_prefix_textobj('i')<cr>
"onoremap  a <Cmd>call <SID>reset_prefix_textobj('a')<cr>
"xnoremap  a <Cmd>call <SID>reset_prefix_textobj('a')<cr>

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

" For: startinsert mode even from visual mode or operator-pending mode.
onoremap <a-a> <esc>a
onoremap <a-i> <esc>i
vnoremap <a-a> <esc>a
vnoremap <a-i> <esc>i
