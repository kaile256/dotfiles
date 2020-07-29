" TOML: operator.toml
" Repo: SausageCats/vim-operator-swap
" Another: source/operator-swap-SausageCats.vim

" Have to do marking before swap
" nmap \c <Plug>(operator-swap-area1)
nmap \C <Plug>(operator-swap-area2-swap)

" xmap \c <Plug>(operator-swap-area1)
xmap \C <Plug>(operator-swap-area2-swap)

" Note: \cc forces \c to fail.
" nmap \cc V<Plug>(operator-swap-area1)
" nmap \CC V<Plug>(operator-swap-area2-swap)
" nmap \Cc V<Plug>(operator-swap-area2-swap)

let s:is_swapping = 0
function! s:simple_swap() abort
  augroup myOperatorSwapToggle
    au! BufLeave,TextChanged,InsertEnter <buffer> let s:is_swapping = 0
          \ | au! myOperatorSwapToggle
  augroup END

  if s:is_swapping
    let s:is_swapping = 0
    return "\<Plug>(operator-swap-area2-swap)"
  endif

  let s:is_swapping = 1
  call s:set_mappings_to_clear()
  return "\<Plug>(operator-swap-area1)"
endfunction

function! s:set_mappings_to_clear() abort
  let keys = ['<Esc>', '<C-c>']
  let cmd = ''
  for k in keys
    let k = substitute(k, '<', '<lt>', 'g')
    let cmd .= ':<C-u>call <SID>clear_swapping('. string(k) .')<CR>'
  endfor
  for k in keys
    exe 'nmap <silent>' k cmd
  endfor
endfunction

function! s:clear_swapping(key) abort
  let s:is_swapping = 0
  exe 'nunmap' a:key
endfunction

nmap <expr> \c <SID>simple_swap()
xmap <expr> \c <SID>simple_swap()
