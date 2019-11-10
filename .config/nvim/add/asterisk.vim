" From: motion.toml
" Repo: haya14busa/vim-asterisk
" Fork: kaile256/vim-asterisk
" Ref: machakann/vim-sandwich

noremap! <c-r>/  <c-r>= substitute(@/, '\\V', '', 'e')<cr>
noremap! <c-r> <c-r>= substitute(@/, '\\V', '', 'e')<cr>

tnoremap <silent> <c-r>/  <c-\><c-n>"= substitute(@/, '\\V', '', 'e')<cr>pi
tnoremap <silent> <c-r> <c-\><c-n>"= substitute(@/, '\\V', '', 'e')<cr>pi

"function! asterisk#substitute(operator, direction) abort "{{{
"" TODO: Make the function work
"  " Note: because this func has autoload func., cannot be autoload func. itself.
"
"  " Specify operator wanted {{{2
"  " Note: a:operator acceptable is ['d', 'c', 'p', 'auto'].
"  if a:operator ==# 'auto'
"    let l:operator = v:operator
"    " Note: conditions below are for in visual mode.
"    " TODO: specify 'v'; v:operator do never become 'v'.
"  elseif a:operator ==# 'd'
"    let l:operator = 'd'
"  elseif a:operator ==# 'c'
"    let l:operator = 'c'
"  elseif a:operator !=# 'p'
"    " Thrown messages {{{3
"    " Note: 'p' is unnecessary to specify l:operator in this function at least.
"    "       because 'p' use different syntax than 'd' and 'c'.
"    throw "Please set a:operator, whether 'd', 'c' or 'p', in asterisk#substitute('here!', direction) on vmap"
"  else
"    throw "Please set a:operator, whether 'd', 'c' or 'auto', in asterisk#substitute('here!', direction) on omap or nmap"
"    "
"  endif
"
"  " Specify operating direction {{{2
"  if a:direction ==# ('up' || 'upward')
"    let l:direction = 'gN'
"  elseif a:direction ==# ('down' || 'downward')
"    let l:direction = 'gn'
"  else
"    throw "Please set a direction, whether 'up' or 'down' in asterisk#substitute(operator, 'here!')"
"  endif
"
"  " Return: dot-jumpable substitution {{{2
"  if line("'<") != line("'>")
"    exe 'norm!'. l:operator
"    return
"  endif
"
"  call asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
"
"  " TODO: specify 'v'; v:operator do never become 'v'.
"  " Note: a:operator acceptable is ['d', 'c', 'p', 'auto'].
"  if a:operator ==# 'p'
"    " e.g., 'norm! cgn<c-r>0<esc>'
"    exe 'norm! c'. l:direction .''. l:regname .''
"    return
"  endif
"
"  " e.g., 'norm! dgn', 'cgn'
"  exe 'norm! '. l:operator . l:direction
"endfunction "}}}

" Keymaps; <Plug>-zation {{{1
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-delete-upward)
      \ (line("'<") != line("'>"))? 'd':
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'dgN'
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-delete-downward)
      \ (line("'<") != line("'>"))? 'd':
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'dgn'
" Note: troublesome in the case append in front of the selected word.
"       e.g., risk -> asterisk in forward.
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-change-upward)
      \ (line("'<") != line("'>"))? 'c':
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgN'
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-change-downward)
      \ (line("'<") != line("'>"))? 'c':
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgn'

" TODO: DotSubstitute by Paste
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-paste-upward)
      \ (line("'<") == line("'>"))?
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgn<c-r>1<esc>': 'p'
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-paste-downward)
      \ (line("'<") == line("'>"))?
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgN<c-r>1<esc>': 'p'

" Experimental: for test
"xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-delete-downward)
"      \ asterisk#substitute('d', 'downward')
"xnoremap <silent> <Plug>(asterisk-dot-substitute-delete-downward)
"      \ <Cmd>call asterisk#substitute('d', 'downward')<cr>
"xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-paste-downward)
"      \ asterisk#substitute('p', 'downward')

"onoremap <silent> <Plug>(asterisk-dot-substitute-operator-upward)
"      \ :<c-u>set operatorfunc=asterisk#substitute('auto','upward')<cr>g@
"onoremap <silent> <Plug>(asterisk-dot-substitute-operator-downward)
"      \ :<c-u>set operatorfunc=asterisk#substitute('auto','downward')<cr>g@

" keymaps; standard {{{1
" Note: Few case to expect exclusive search
nmap *   <Plug>(asterisk-gz*)
nmap g*  <Plug>(asterisk-g*)
nmap #   <Plug>(asterisk-gz#)
nmap g#  <Plug>(asterisk-g#)
nmap z*  <Plug>(asterisk-z*)
nmap gz* <Plug>(asterisk-*)
nmap z#  <Plug>(asterisk-z#)
nmap gz# <Plug>(asterisk-#)

xmap *   <Plug>(asterisk-gz*)
xmap g*  <Plug>(asterisk-g*)
xmap #   <Plug>(asterisk-gz#)
xmap g#  <Plug>(asterisk-g#)
xmap z*  <Plug>(asterisk-z*)
xmap gz* <Plug>(asterisk-*)
xmap z#  <Plug>(asterisk-z#)
xmap gz# <Plug>(asterisk-#)

" keymaps; substitute "{{{1
" Note: x/s work duplicated with d/c respectively.
xmap x <Plug>(asterisk-dot-substitute-delete-downward)
" TODO: using `], smoother dot-repeat!
xmap s <Plug>(asterisk-dot-substitute-change-downward)
" Note: when over lines, keep blockwise even on X/S, unrepeatable.
xmap X <Plug>(asterisk-dot-substitute-delete-upward)
" TODO: using `[, smoother dot-repeat!
xmap S <Plug>(asterisk-dot-substitute-change-upward)

" WIP: paste/operator "{{{1
" when paste on selected area, we don't use initial P.
xmap gp <Plug>(asterisk-dot-substitute-paste-downward)
xmap P  <Plug>(asterisk-dot-substitute-paste-upward)

omap * <Plug>(asterisk-dot-substitute-operator-downward)
omap # <Plug>(asterisk-dot-substitute-operator-upward)
" Mnemonic: dot-Repeatable
omap r <Plug>(asterisk-dot-substitute-operator-downward)
omap R <Plug>(asterisk-dot-substitute-operator-upward)

