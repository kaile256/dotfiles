" From: motion.toml
" Repo: AndrewRadev/splitjoin.vim

" nnoremap <silent> <space>J :call <SID>try_splitjoin()<cr>
nnoremap <silent> <space>J :set operatorfunc=<SID>operator_join<CR>g@

function! s:operator_join(...) abort
  if line("'[") != line("']")
    " Return as operator
    exe "'[,']" (&ft ==# 'vim' ? 'SandJoin' : 'join')
    return
  endif

  let save_line = getline('.')
  silent SplitjoinJoin
  if getline('.') !=# save_line | return | endif

  exe &ft ==# 'vim'
        \ ? "norm \<Plug>(SandJoin-J)"
        \ : 'norm! J'
endfunction

nnoremap <silent> gS :<c-u>SplitjoinSplit<cr>
