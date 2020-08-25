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
