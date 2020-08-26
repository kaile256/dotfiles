" From: myplug.toml
" Repo: kaile256/vim-SandJoin
" Another: add/SandJoin.vim

nnoremap <silent> <SID>(SandJoin-operator)
      \ :set operatorfunc=<SID>operator_join<CR>g@
nmap <space>J <SID>(SandJoin-operator)
xmap <space>J <Plug>(SandJoin-J)

function! s:operator_join(...) abort
  if line("'[") != line("']")
    " Return as operator
    '[,'] SandJoin norm! J
    return
  endif

  '[,'] SandJoin norm! J
endfunction

