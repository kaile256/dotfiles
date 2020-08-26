" From: myplug.toml
" Repo: kaile256/vim-SandJoin
" Another: add/SandJoin.vim

let g:SandJoin#no_default_mappings = 1

" let g:SandJoin#patterns = {
"     \ '_': [
"     \   ['[^ \t\\]\zs\s\+', ' ', 'GLOBAL'],
"     \ ],
"     \ 'sh': [
"     \   ['\(^\|[;\\]\|do\|then\)\@<!$', '; ', '^bottom'],
"     \   ['[ \t\\]*$', '', '^bottom'],
"     \ ],
"     \ 'vim': [
"     \   ['^\s*\([^"| \t\\]\)\s*', ' | \1', '^top'],
"     \   ['^[ \t\\]*', '', '^top'],
"     \ ],
"     \ }

nnoremap <silent> \J :set operatorfunc=<SID>operator_join<CR>g@

function! s:operator_join(_wise) abort
  exe "'[,']" (&ft ==# 'vim' ? 'SandJoin' : 'join')
endfunction

nnoremap <silent> <SID>(operator-join) :set operatorfunc=<SID>operator_join<CR>g@
nmap <space>J <SID>(operator-join)
nmap <SID>(try-splitjoin) <SID>(operator-join)l

function! s:operator_join(...) abort
  if line("'[") != line("']")
    " Return as operator
    exe "'[,']" (&ft ==# 'vim' ? 'SandJoin' : 'join')
    return
  endif

  exe &ft ==# 'vim'
        \ ? "norm \<Plug>(SandJoin-J)"
        \ : 'norm! J'
endfunction
