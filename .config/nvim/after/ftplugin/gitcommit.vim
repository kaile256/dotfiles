" setl spell spl=en_us,cjk
setlocal colorcolumn=73
setlocal nonumber
setlocal signcolumn=
setlocal bufhidden=wipe

setlocal formatoptions+=t " Auto-wrap as &textwidth

map <buffer><expr> [c repmo#Key('<Plug>(gitcommitmsg-prev)', '<Plug>(gitcommitmsg-next)')
map <buffer><expr> ]c repmo#Key('<Plug>(gitcommitmsg-next)', '<Plug>(gitcommitmsg-prev)')
sunmap <buffer> [c
sunmap <buffer> ]c

map <buffer><expr> [m repmo#Key('<Plug>(gitcommitmsg-prev)', '<Plug>(gitcommitmsg-next)')
map <buffer><expr> ]m repmo#Key('<Plug>(gitcommitmsg-next)', '<Plug>(gitcommitmsg-prev)')
sunmap <buffer> [m
sunmap <buffer> ]m

nnoremap <silent> <Plug>(gitcommitmsg-next) :<C-u>call <SID>search_msg('')<CR>
nnoremap <silent> <Plug>(gitcommitmsg-prev) :<C-u>call <SID>search_msg('b')<CR>

function! s:search_msg(flags) abort
  " Find the next/prev candidate to be left.

  let pats_msg = [
        \ '# This is the 1st commit message:',
        \ '# This is the commit message #\d\+:',
        \ ]

  let pat_msg = join(pats_msg, '\|')

  if !search(pat_msg, a:flags)
    return
  endif

  if a:flags =~# 'b'
    " searching backward twice
    call search(pat_msg, a:flags)
  endif

  norm! j
  call search('\S')
endfunction

norm! gg
call s:search_msg('W')

function! s:is_editing_new_commit() abort
  return join(getline(1, search('\S', 'n')))
        \ !~# '^\s*# Please enter the commit message'
endfunction
if s:is_editing_new_commit()
  finish
endif
delfunction s:is_editing_new_commit

startinsert
