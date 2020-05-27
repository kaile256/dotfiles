scriptencoding utf-8
" From: motion.toml
" Repo: haya14busa/vim-asterisk
" Fork: kaile256/vim-asterisk
" Ref: machakann/vim-sandwich

"" Ref: https://twitter.com/Bakudankun/status/1207057884581900289
"nnoremap <silent><expr> * v:count ? '*'
      "\ : ':sil exe "keepj norm! *" <Bar> call winrestview(' . string(winsaveview()) . ')<CR>'

" Note: Vim regards <C-_> as <C-/>
noremap! <expr><silent> <c-r>/     substitute(@/, '^\\[mv]', '', 'ie')
tnoremap <expr><silent> <c-r>/     substitute(@/, '^\\[mv]', '', 'ie')
noremap! <expr><silent> <c-r><c-_> substitute(@/, '^\\[mv]', '', 'ie')
tnoremap <expr><silent> <c-r><c-_> substitute(@/, '^\\[mv]', '', 'ie')

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

" nmap <c-w>*   <c-w>s<Plug>(asterisk-gz*)
" nmap <c-w>g*  <c-w>s<Plug>(asterisk-g*)
" nmap <c-w>#   <c-w>s<Plug>(asterisk-gz#)
" nmap <c-w>g#  <c-w>s<Plug>(asterisk-g#)
" nmap <c-w>z*  <c-w>s<Plug>(asterisk-z*)
" nmap <c-w>gz* <c-w>s<Plug>(asterisk-*)
" nmap <c-w>z#  <c-w>s<Plug>(asterisk-z#)
" nmap <c-w>gz# <c-w>s<Plug>(asterisk-#)
" nmap <c-w><space>*   <c-w>v<Plug>(asterisk-gz*)
" nmap <c-w><space>g*  <c-w>v<Plug>(asterisk-g*)
" nmap <c-w><space>#   <c-w>v<Plug>(asterisk-gz#)
" nmap <c-w><space>g#  <c-w>v<Plug>(asterisk-g#)
" nmap <c-w><space>z*  <c-w>v<Plug>(asterisk-z*)
" nmap <c-w><space>gz* <c-w>v<Plug>(asterisk-*)
" nmap <c-w><space>z#  <c-w>v<Plug>(asterisk-z#)
" nmap <c-w><space>gz# <c-w>v<Plug>(asterisk-#)

" xmap <c-w>*   <c-w>s<Plug>(asterisk-gz*)
" xmap <c-w>g*  <c-w>s<Plug>(asterisk-g*)
" xmap <c-w>#   <c-w>s<Plug>(asterisk-gz#)
" xmap <c-w>g#  <c-w>s<Plug>(asterisk-g#)
" xmap <c-w>z*  <c-w>s<Plug>(asterisk-z*)
" xmap <c-w>gz* <c-w>s<Plug>(asterisk-*)
" xmap <c-w>z#  <c-w>s<Plug>(asterisk-z#)
" xmap <c-w>gz# <c-w>s<Plug>(asterisk-#)
" xmap <c-w><space>*   <c-w>v<Plug>(asterisk-gz*)
" xmap <c-w><space>g*  <c-w>v<Plug>(asterisk-g*)
" xmap <c-w><space>#   <c-w>v<Plug>(asterisk-gz#)
" xmap <c-w><space>g#  <c-w>v<Plug>(asterisk-g#)
" xmap <c-w><space>z*  <c-w>v<Plug>(asterisk-z*)
" xmap <c-w><space>gz* <c-w>v<Plug>(asterisk-*)
" xmap <c-w><space>z#  <c-w>v<Plug>(asterisk-z#)
" xmap <c-w><space>gz# <c-w>v<Plug>(asterisk-#)

" keymaps; Substitute "{{{1
" Ref: add/submode.vim
"nmap x <Plug>(asterisk-dot-substitute-delete-downward)
"nmap X <Plug>(asterisk-dot-substitute-delete-upward)
"nmap s <Plug>(asterisk-dot-substitute-change-downward)
"nmap S <Plug>(asterisk-dot-substitute-change-upward)
" Note: x/s work duplicated with d/c respectively.
xmap x <Plug>(asterisk-dot-substitute-delete-downward)
" TODO: using `], smoother dot-repeat!
xmap s <Plug>(asterisk-dot-substitute-change-downward)
" Note: when over lines, keep blockwise even on X/S, unrepeatable.
xmap X <Plug>(asterisk-dot-substitute-delete-upward)
" TODO: using `[, smoother dot-repeat!
xmap S <Plug>(asterisk-dot-substitute-change-upward)

" WIP: keymaps by a wrapper function {{{2

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

function! asterisk#substitute(operator, direction) abort
  " TODO: Make the function work
  " Note: because this func has autoload func., cannot be autoload func. itself.

  " Specify operator wanted {{{3
  " Note: a:operator acceptable is ['d', 'c', 'p', 'auto'].
  if a:operator ==# 'auto'
    let operator = v:operator
    " Note: conditions below are for in visual mode.
    " TODO: specify 'v'; v:operator do never become 'v'.
  elseif a:operator ==# 'd'
    let operator = 'd'
  elseif a:operator ==# 'c'
    let operator = 'c'
  elseif a:operator !=# 'p'
    " Throw error message {{{4
    " Note: 'p' is unnecessary to specify l:operator in this function at least.
    "       because 'p' use different syntax than 'd' and 'c'.
    throw "Please set a:operator, whether 'd', 'c' or 'p', in asterisk#substitute('here!', direction) on vmap"
  else
    throw "Please set a:operator, whether 'd', 'c' or 'auto', in asterisk#substitute('here!', direction) on omap or nmap"
    "
  endif

  " Specify operating direction {{{3
  if a:direction =~# 'up\%[ward]'
    let direction = 'gN'
  elseif a:direction =~# 'down\%[ward]'
    let direction = 'gn'
  else
    throw "Please set a direction, whether 'up' or 'down' in asterisk#substitute(operator, 'here!')"
  endif

  " Return: dot-jumpable substitution {{{3
  if line("'<") != line("'>")
    return operator
  endif

  call asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})

  " TODO: specify 'v'; v:operator do never become 'v'.
  " Note: a:operator acceptable is ['d', 'c', 'p', 'auto'].
  if a:operator ==# 'p'
    " e.g., 'c'. 'gn' <c-r>'. 0 .'<esc>'
    return 'c'. direction ."\<C-r>". regname ."\<Esc>"
  endif

  " e.g., 'c' . 'gn'
  return operator . direction
endfunction
" <Plug>-zation {{{2
" Xmaps {{{3
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

" Nmaps {{{3
" TODO: make them work in nmaps
nnoremap <expr><silent> <Plug>(asterisk-dot-substitute-delete-downward)
      \ 'v'.
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'dgn'
nnoremap <expr><silent> <Plug>(asterisk-dot-substitute-delete-upward)
      \ 'v'.
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'dgN'
" Note: troublesome in the case append in front of the selected word.
"       e.g., risk -> asterisk in forward.
nnoremap <expr><silent> <Plug>(asterisk-dot-substitute-change-downward)
      \ 'v'.
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgn'
nnoremap <expr><silent> <Plug>(asterisk-dot-substitute-change-upward)
      \ 'v'.
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgN'

" TODO: DotSubstitute by Paste
nnoremap <expr><silent> <Plug>(asterisk-dot-substitute-paste-upward)
      \ 'v'.
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgn<c-r>1<esc>': 'p'
nnoremap <expr><silent> <Plug>(asterisk-dot-substitute-paste-downward)
      \ 'v'.
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgN<c-r>1<esc>': 'p'

" WIP: paste/operator "{{{1
" when paste on selected area, we don't use initial P.
xmap gp <Plug>(asterisk-dot-substitute-paste-downward)
xmap P  <Plug>(asterisk-dot-substitute-paste-upward)

omap * <Plug>(asterisk-dot-substitute-operator-downward)
omap # <Plug>(asterisk-dot-substitute-operator-upward)
" Mnemonic: dot-Repeatable
omap r <Plug>(asterisk-dot-substitute-operator-downward)
omap R <Plug>(asterisk-dot-substitute-operator-upward)

