"""" From: Initial.toml

"""" KEYBIND
" :FZF! starts fzf on full-window.
nnoremap <silent> <a-o> :<c-u>FZF<cr>

""""" DEFINITION
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

augroup FzfBuffer
  au! FileType fzf setlocal noshowmode
  "" Quich Change
  au! FileType fzf tnoremap <a-r> <c-\><c-n>:q<cr><c-l> :<c-u>Rg 
  au! FileType fzf tnoremap <a-b> <c-\><c-n>:q<cr><c-l> :<c-u>Buffers<cr>
  au! FileType fzf tnoremap <a-r> <c-\><c-n>:q<cr><c-l> :<c-u>Rg 
  au! FileType fzf tnoremap <a-r> <c-\><c-n>:q<cr><c-l> :<c-u>Rg 
augroup END
function! FzfKeymap()
  tnoremap <a-r> <c-\><c-n>:q<cr><c-l> :<c-u>Rg          
  tnoremap <a-b> <c-\><c-n>:q<cr><c-l> :<c-u>Buffers<cr>
  tnoremap <a-r> <c-\><c-n>:q<cr><c-l> :<c-u>Rg          
  tnoremap <a-r> <c-\><c-n>:q<cr><c-l> :<c-u>Rg          
endfunction


"""" GENERAL
"" down/up/left/right
let g:fzf_layout = { 'up': '~20%' }

let g:fzf_action = {
      \ 'alt-q' : 'quit',
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-c': function('s:build_quickfix_list'),
      \ 'ctrl-z': '',
      \ 'ctrl-b': 'tab split',
      \ 'ctrl-o': 'split',
      \ 'ctrl-s': 'split' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

