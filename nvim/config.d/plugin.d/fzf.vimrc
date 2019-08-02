"""" Info: https://github.com/junegunn/fzf.vim
"""" From: Initial.toml

"""" KEYBIND
" :FZF! starts fzf on full-window.
nnoremap <silent> <a-o><a-o> :<c-u>FZF<cr>
nnoremap <silent> <a-o>o     :<c-u>FZF<cr>
nnoremap <silent> <a-o><a-b> :<c-u>Buffers<cr><a-o>
nnoremap <silent> <a-o>b     :<c-u>Buffers<cr><a-o>
nnoremap <silent> <a-o><a-r> :<c-u>Rg<cr><a-o>
nnoremap <silent> <a-o>r     :<c-u>Rg<cr><a-o>

""""" DEFINITION
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

augroup FzfBuffer
  au! FileType fzf setlocal noshowmode
  "" Quich Change
  au! FileType fzf call s:fzf_keymap()
augroup END

function! s:fzf_keymap()
  "" Quit
  " <a-k> is for pane-leap.
  tnoremap <silent><buffer> <a-b> <c-l><c-\><c-n> :<c-u>Buffers<cr>
  tnoremap <silent><buffer> <a-c> <c-l><c-\><c-n> :<c-u>Colors<cr>
  tnoremap <silent><buffer> <a-h> <c-l><c-\><c-n> :<c-u>Helptags<cr>
  tnoremap <silent><buffer> <a-/> <c-l><c-\><c-n> :<c-u>History/<cr>
  tnoremap <silent><buffer> <a-;> <c-l><c-\><c-n> :<c-u>History:<cr>
  tnoremap <silent><buffer> <a-f> <c-l><c-\><c-n> :<c-u>History<cr>
  tnoremap <silent><buffer> <a-m> <c-l><c-\><c-n> :<c-u>Marks<cr>
  tnoremap <silent><buffer> <a-p> <c-l><c-\><c-n> :<c-u>Maps<cr>
  tnoremap <silent><buffer> <a-q> <c-l><c-\><c-n> :q<cr>
  tnoremap <silent><buffer> <a-r> <c-l><c-\><c-n> :<c-u>Rg
endfunction


"""" GENERAL
let g:fzf_history_dir = '~/.local/share/fzf-history'
"" down/up/left/right
let g:fzf_layout = { 'down': '~20%' }

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-c': function('s:build_quickfix_list'),
      \ 'ctrl-z': '',
      \ 'ctrl-b': 'tab split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-o': 'split',
      \ 'ctrl-s': 'split' }

" Customize fzf colors to match your color scheme
"let g:fzf_colors =
"      \ { 'fg':      ['fg', 'Normal'],
"      \ 'bg':      ['bg', 'Normal'],
"      \ 'hl':      ['fg', 'Comment'],
"      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"      \ 'hl+':     ['fg', 'Statement'],
"      \ 'info':    ['fg', 'PreProc'],
"      \ 'border':  ['fg', 'Ignore'],
"      \ 'prompt':  ['fg', 'Conditional'],
"      \ 'pointer': ['fg', 'Exception'],
"      \ 'marker':  ['fg', 'Keyword'],
"      \ 'spinner': ['fg', 'Label'],
"      \ 'header':  ['fg', 'Comment'] }
