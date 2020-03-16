" From: motion.toml
" Repo: AndrewRadev/splitjoin.vim

nnoremap <silent> <space>J :call <SID>try_splitjoin()<cr>

function! s:try_splitjoin() abort
  let prev_line = getline('.')
  silent SplitjoinJoin

  if getline('.') ==# prev_line
    exe "norm \<Plug>(SandJoin-J)"
  endif
endfunction

nnoremap <silent> gS :<c-u>SplitjoinSplit<cr>
