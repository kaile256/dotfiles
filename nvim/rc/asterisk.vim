" From: finder.toml
" Alter: rc/autoload/asterisk.vim
" Repo: haya14busa/vim-asterisk

" TODO: Make the function work
function! asterisk#substitute(operator, direction) abort "{{{1
  " Specify operator wanted {{{2
  " Note: a:operator acceptable is ['d', 'c', 'p', 'auto'].
  if v:operator !='v' && a:operator ==# 'auto'
    let l:operator = v:operator
  elseif v:operator ==# 'd' || a:operator ==# 'd'
    let l:operator = 'd'
  elseif v:operator ==# 'c' || a:operator ==# 'c'
    let l:operator = 'c'
    if v:operator ==# 'v' && a:operator !=# 'p'
      " Note: 'p' is unnecessary to specify l:operator in this function at least.
      "       because 'p' use different syntax than 'd' and 'c'.
      throw "Please set a:operator, whether 'd', 'c' or 'p', in asterisk#substitute('here!', direction) on vmap"
    else
      throw "Please set a:operator, whether 'd', 'c' or 'auto', in asterisk#substitute('here!', direction) on omap"
    endif
  endif

  " Specify operating direction {{{2
  if a:direction ==# 'up' || a:direction ==# 'upward'
    let l:direction = 'gN'
  elseif a:direction ==# 'down' || a:direction ==# 'downward'
    let l:direction = 'gn'
  else
    throw "Please set a:direction, whether 'up' or 'down' in asterisk#substitute(operator, 'here!')"
  endif

  " Return: start a dot-jumpable substitution below {{{2
  call asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
  " Note: a:operator acceptable is ['d', 'c', 'p', 'auto'].
  if v:operator ==# 'v'
    if a:operator ==# 'p'
      if v:event.regname ==# '"'
        " Note: before pasting, this function registers to unnamed because of 'c'
        if v:event.regname ==# @0
          let l:regname = 0
        else
          let l:regname = 1
        endif
      elseif v:event.regname ==# [1-9]
        let l:regname = v:event.regname + 1
        let l:regname =  v:event.regname
      endif
      " like 'norm cgn<c-r>0<esc>'
      exe 'norm c'. l:direction .'<c-r>'. l:regname .'<esc>'
      return
    endif
    " like 'norm dgn'
    exe 'norm '. l:operator .''. l:direction
  endif
endfunction "}}}1

" Keymaps; <Plug>-zation {{{1
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-delete-upward)
      \ (line("'<") == line("'>"))?
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'dgN': 'd'
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-delete-downward)
      \ (line("'<") == line("'>"))?
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'dgn': 'd'
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-change-upward)
      \ (line("'<") == line("'>"))?
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgN': 'c'
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-change-downward)
      \ (line("'<") == line("'>"))?
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgn': 'c'
" TODO: DotSubstitute by Paste
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-paste-upward)
      \ (line("'<") == line("'>"))?
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgn<c-r>1<esc>': 'p'
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-paste-downward)
      \ (line("'<") == line("'>"))?
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgN<c-r>1<esc>': 'p'

onoremap <silent> <Plug>(asterisk-dot-substitute-operator-upward)
      \ :<c-u>set operatorfunc=asterisk#substitute('auto','upward')<cr>g@
onoremap <silent> <Plug>(asterisk-dot-substitute-operator-downward)
      \ :<c-u>set operatorfunc=asterisk#substitute('auto','upward')<cr>g@
"}}}1

if exists('g:asterisk#no_default_mappings_all') | finish | endif

" Keymaps; standard {{{1
if exists('g:asterisk#no_default_mappings_standard') | finish | endif

" Note: Few case to expect exclusive search
nmap *  <Plug>(asterisk-gz*)
nmap g* <Plug>(asterisk-g*)
nmap #  <Plug>(asterisk-gz#)
nmap g# <Plug>(asterisk-g#)

xmap *  <Plug>(asterisk-gz*)
xmap g* <Plug>(asterisk-g*)
xmap #  <Plug>(asterisk-gz#)
xmap g# <Plug>(asterisk-g#)

" Keymaps; substitute {{{1
if exists('g:asterisk#no_default_mappings_substitute') | finish | endif
" when paste on selected area, we don't use initial P.
xmap gp <Plug>(asterisk-dot-substitute-paste-downward)
xmap P <Plug>(asterisk-dot-substitute-paste-upward)

" Note: x/s work duplicated with d/c respectively.
xmap x <Plug>(asterisk-dot-substitute-delete-downward)
xmap s <Plug>(asterisk-dot-substitute-change-downward)
" Note: when over lines, keep blockwise even on X/S, unrepeatable.
xmap X <Plug>(asterisk-dot-substitute-delete-upward)
xmap S <Plug>(asterisk-dot-substitute-change-upward)

" under
omap u     <Plug>(asterisk-dot-substitute-operator-downward)
" over
omap o     <Plug>(asterisk-dot-substitute-operator-upward)
omap *     <Plug>(asterisk-dot-substitute-operator-downward)
omap #     <Plug>(asterisk-dot-substitute-operator-upward)
omap <c-d> <Plug>(asterisk-dot-substitute-operator-downward)
omap <c-u> <Plug>(asterisk-dot-substitute-operator-upward)
