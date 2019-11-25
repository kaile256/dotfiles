" From: motion.toml
" Repo: AndrewRadev/splitjoin.vim

" Note: works only in expected situations
nnoremap <silent> J :call <SID>try_splitjoin()<cr>

function! s:try_splitjoin() abort
  let prev_line = getline('.')
  silent SplitjoinJoin

  if getline('.') ==# prev_line
    norm! J
  endif
endfunction

nnoremap <silent> gS :<c-u>SplitjoinSplit<cr>
