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

nnoremap <silent> <SID>(SandJoin-operator)
      \ :set operatorfunc=<SID>operator_join<CR>g@
nmap <space>J <SID>(SandJoin-operator)

function! s:operator_join(...) abort
  if line("'[") != line("']")
    " Return as operator
    exe "'[,'] norm \<Plug>(SandJoin-J)"
    return
  endif

  exe "norm \<Plug>(SandJoin-J)"
endfunction
