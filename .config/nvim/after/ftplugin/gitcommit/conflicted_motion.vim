" Init: ftplugin/gitcommit/init.vim
" RUNTIME: $VIMRUNTIME/ftplugin/gitcommit.vim

map <nowait><buffer><expr> [c repmo#Key('<Plug>(gitcommitmsg-prev)', '<Plug>(gitcommitmsg-next)')
map <nowait><buffer><expr> ]c repmo#Key('<Plug>(gitcommitmsg-next)', '<Plug>(gitcommitmsg-prev)')
sunmap <buffer> [c
sunmap <buffer> ]c

map <nowait><buffer><expr> [m repmo#Key('<Plug>(gitcommitmsg-prev)', '<Plug>(gitcommitmsg-next)')
map <nowait><buffer><expr> ]m repmo#Key('<Plug>(gitcommitmsg-next)', '<Plug>(gitcommitmsg-prev)')
sunmap <buffer> [m
sunmap <buffer> ]m

nnoremap <silent> <Plug>(gitcommitmsg-next) :<C-u>call <SID>search_msg('downward')<CR>
nnoremap <silent> <Plug>(gitcommitmsg-prev) :<C-u>call <SID>search_msg('upward')<CR>


function! s:search_msg(direction) abort
  " Find the next/prev candidate to be left.

  const pats_msg = [
        \ '# This is the 1st commit message:',
        \ '# This is the commit message #\d\+:',
        \ ]

  const pat_msg = '\%('. join(pats_msg, '\|') .'\)'

  const flags = a:direction ==? 'upward' ? 'b' : ''
  const lnum_adjacent_msg = search(pat_msg, flags)

  if a:direction ==? 'upward'
    " Search upward twice to get out of current msg scope.
    call search(pat_msg, 'b')
    exe prevnonblank(lnum_adjacent_msg - 1)
    return
  endif
endfunction

call s:search_msg('W')

