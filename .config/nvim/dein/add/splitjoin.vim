" From: motion.toml
" Repo: AndrewRadev/splitjoin.vim

let g:splitjoin_join_mapping = ''
let g:splitjoin_split_mapping = ''

nnoremap <silent> gS :<c-u>SplitjoinSplit<cr>

" nnoremap <silent> <space>J :call <SID>try_splitjoin()<cr>
nnoremap <silent> <SID>(operator-join) :set operatorfunc=<SID>operator_join<CR>g@
nmap <space>J <SID>(operator-join)

nmap <SID>(try-splitjoin) <SID>(operator-join)l
nmap <space>JJ <SID>(try-splitjoin)

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
