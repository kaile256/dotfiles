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

noremap <silent> <Plug>(gitcommitmsg-next) :<C-u>call <SID>search_msg('downward')<CR>
noremap <silent> <Plug>(gitcommitmsg-prev) :<C-u>call <SID>search_msg('upward')<CR>


function! s:search_msg(direction) abort
  " Find the next/prev candidate to be left.

  const pats_msg = [
        \ '# This is the 1st commit message:',
        \ '# This is the commit message #\d\+:',
        \ ]

  const pat_msg = '\%('. join(pats_msg, '\|') .'\)'
  const pat_msg_end = pat_msg .'\%(\s*\n\)\+'
  const pat_commit_description = pat_msg_end .'\zs\s*[^#]'

  const flags = a:direction ==? 'upward' ? 'b' : ''
  if a:direction ==? 'upward'
    call search(pat_commit_description, 'bW')
    " Search upward twice to get out of current msg scope.
    call search(pat_commit_description, 'bW')
  else
    echo search(pat_commit_description, 'W')
  endif
endfunction

call s:search_msg('downward')
