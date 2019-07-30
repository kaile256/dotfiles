"""" From: Initial.toml

"""" KEYBIND
" :FZF! starts fzf on full-window.
nnoremap <silent> <a-o> :FZF<cr>

""""" DEFINITION
"function! s:build_quickfix_list(lines)
"  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
"  copen
"  cc
"endfunction

"""" CONFIG
"let g:fzf_action = {
"      \ 'ctrl-z': '',
"      \ 'ctrl-o': 'split',
"      \ 'ctrl-s': 'split' }

"" down/up/left/right
"let g:fzf_layout = { 'down': '~40%' }

augroup FzfBuffer
  au! FileType fzf setlocal noshowmode
augroup END
