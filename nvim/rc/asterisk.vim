" From: finder.toml
" Alter: rc/autoload/asterisk.vim
" Repo: haya14busa/vim-asterisk

function! asterisk#substitute(operator, direction)
" TODO: Not yet work
  if v:operator ==# 'd' || a:operator ==# 'd'
    let l:operator = 'd'
  elseif v:operator ==# 'c' || a:operator ==# 'c'
    let l:operator = 'c'
  elseif a:operator ==# 'auto'
    let l:operator = v:operator
  else
    throw "Please set a:operator, whether 'd' or 'c', in asterisk#substitute('here!', direction)"
  endif

  if a:direction ==# 'up' || a:direction ==# 'upward'
    let l:direction = 'N'
  elseif a:direction ==# 'down' || a:direction ==# 'downward'
    let l:direction = 'n'
  else
    throw "Please set a:direction, whether 'up' or 'down' in asterisk#substitute(operator, 'here!')"
  endif

  call asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
  if v:operator ==# 'v'
    exe 'norm '. l:operator .'g'. l:direction
  endif
endfunction

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
" TODO: Manual Substitute by Paste
command! -nargs=+ PasteDotSubstituteUpward
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-paste-upward)
      \ (line("'<") == line("'>"))?
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgn<c-r>"': 'p'
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-paste-downward)
      \ (line("'<") == line("'>"))?
      \ asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'pgN': 'P'

onoremap <silent> <Plug>(asterisk-dot-substitute-operator-upward)
      \ :<c-u>set operatorfunc=asterisk#substitute('auto','upward')<cr>g@
onoremap <silent> <Plug>(asterisk-dot-substitute-operator-downward)
      \ :<c-u>set operatorfunc=asterisk#substitute('auto','upward')<cr>g@

if exists('g:asterisk#no_default_mappings_all') | finish | endif

if exists('g:asterisk#no_default_mappings_substitute') | finish | endif

" Note: x/s work duplicated with d/c respectively.
xmap x <Plug>(asterisk-dot-substitute-delete-downward)
xmap s <Plug>(asterisk-dot-substitute-change-downward)
" Note: when over lines, keep blockwise even on X/S, unrepeatable.
xmap X <Plug>(asterisk-dot-substitute-delete-upward)
xmap S <Plug>(asterisk-dot-substitute-change-upward)

omap *     <Plug>(asterisk-dot-substitute-operator-downward)
omap #     <Plug>(asterisk-dot-substitute-operator-upward)
omap <c-d> <Plug>(asterisk-dot-substitute-operator-downward)
omap <c-u> <Plug>(asterisk-dot-substitute-operator-upward)

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
