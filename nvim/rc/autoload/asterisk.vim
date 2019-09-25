" From: finder.toml
" Alter: asterisk.vimrc
" Repo: haya14busa/vim-asterisk

function! asterisk#substitute(operator, direction) abort
  if v:operator ==# 'v'
    if line("'<") ==# line("'>")
      exe 'norm '. a:operator
      return
    endif
  endif

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
    exe 'norm'. l:operator .'g'. l:direction
  endif
endfunction

xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-delete-upward)
      \ asterisk#substitute('d', 'upward')
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-delete-downward)
      \ asterisk#substitute('d', 'downward')
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-change-upward)
      \ asterisk#substitute('c', 'upward')
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-change-downward)
      \ asterisk#substitute('c', 'downward')
onoremap <silent> <Plug>(asterisk-dot-substitute-operator-upward)
      \ :<c-u>set operatorfunc=asterisk#substitute('auto', 'upward')<cr>g@
onoremap <silent> <Plug>(asterisk-dot-substitute-operator-downward)
      \ :<c-u>set operatorfunc=asterisk#substitute('auto', 'upward')<cr>g@

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
