" From: motion.toml
" Repo: AndrewRadev/splitjoin.vim

let g:splitjoin_join_mapping = ''
let g:splitjoin_split_mapping = ''

nnoremap <silent> gS :<c-u>SplitjoinSplit<cr>
nnoremap <silent> <space>JJ :<C-u>call <SID>splitjoin()<CR>

function! s:splitjoin() abort
  let save_line = getline('.')
  SplitjoinJoin

  if getline('.') != save_line | return | endif

  echohl ErrorMsg
  echo '[SplitJoin] no patterns matched'
  echohl Normal
endfunction

