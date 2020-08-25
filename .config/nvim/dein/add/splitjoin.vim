" From: motion.toml
" Repo: AndrewRadev/splitjoin.vim

nnoremap <silent> <space>J :call <SID>try_splitjoin()<cr>

function! s:try_splitjoin() abort
  let save_line = getline('.')
  silent SplitjoinJoin
  if getline('.') !=# save_line | return | endif

  exe &ft ==# 'vim'
        \ ? "norm \<Plug>(SandJoin-J)"
        \ : 'norm! J'
endfunction

nnoremap <silent> gS :<c-u>SplitjoinSplit<cr>
