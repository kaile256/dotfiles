" setl spell spl=en_us,cjk
setlocal colorcolumn=73
setlocal nonumber
setlocal signcolumn=
setlocal bufhidden=wipe

setlocal formatoptions+=t " Auto-wrap as &textwidth

nmap <buffer><expr> [c repmo#Key('<Plug>(gitcommitmsg-prev)', '<Plug>(gitcommitmsg-next)')
nmap <buffer><expr> ]c repmo#Key('<Plug>(gitcommitmsg-next)', '<Plug>(gitcommitmsg-prev)')
xmap <buffer><expr> [c repmo#Key('<Plug>(gitcommitmsg-prev)', '<Plug>(gitcommitmsg-next)')
xmap <buffer><expr> ]c repmo#Key('<Plug>(gitcommitmsg-next)', '<Plug>(gitcommitmsg-prev)')

nnoremap <silent> <Plug>(gitcommitmsg-next) :<C-u>call <SID>search_msg('')<CR>
nnoremap <silent> <Plug>(gitcommitmsg-prev) :<C-u>call <SID>search_msg('b')<CR>

function! s:search_msg(flags) abort
  " Find the next/prev candidate to be left.

  let pat_msg = '# This is the 1st commit message:'
        \ .'\|# This is the commit message #\d\+:'

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
