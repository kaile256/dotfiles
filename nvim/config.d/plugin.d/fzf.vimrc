"""" Info: https://github.com/junegunn/fzf.vim
"""" From: Initial.toml

nmap <a-x> <plug>(fzf-maps-n)
"""" DEFINITION
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

"""" KEYBIND
""" Insert Mode
imap <c-f> <plug>(fzf-complete-path)
" Slow to Acivate Ag
"imap <c-g> <plug>(fzf-complete-file-ag)


""" Open on a Pane
" :FZF! starts fzf on full-window.
nnoremap <silent> <a-o>      :<c-u>FZF<cr>
nnoremap <silent> <a-o><a-o> :<c-u>FZF<cr>
nnoremap <silent> <a-o>o     :<c-u>FZF<cr>
nnoremap <silent> <a-o><a-b> :<c-u>Buffers<cr><a-o>
nnoremap <silent> <a-o>b     :<c-u>Buffers<cr><a-o>
if executable('ag')
nnoremap <silent> <a-o><a-a> :<c-u>Ag<cr><a-o>
nnoremap <silent> <a-o>a     :<c-u>Ag<cr><a-o>
endif
if executable('rg')
nnoremap <silent> <a-o><a-r> :<c-u>Rg<cr><a-o>
nnoremap <silent> <a-o>r     :<c-u>Rg<cr><a-o>
endif
nnoremap <silent> <a-o><a-h> :<c-u>Helptags<cr><a-o>
nnoremap <silent> <a-o>h     :<c-u>Helptags<cr><a-o>
nnoremap <silent> <a-o><a-w> :<c-u>Windows<cr><a-o>
nnoremap <silent> <a-o>w     :<c-u>Windows<cr><a-o>
"" Useless?
nnoremap <silent> <a-o><a-m> :<c-u>Marks<cr><a-o>
nnoremap <silent> <a-o>m     :<c-u>Marks<cr><a-o>
nnoremap <silent> <a-o><a-l> :<c-u>BLines<cr><a-o>
nnoremap <silent> <a-o>l     :<c-u>BLines<cr><a-o>

"" Search
nnoremap <silent> <a-o><a-/> :<c-u>History/<cr><a-o>
nnoremap <silent> <a-o>/     :<c-u>History/<cr><a-o>
nnoremap <silent> <a-o><a-;> :<c-u>History:<cr><a-o>
nnoremap <silent> <a-o>;     :<c-u>History:<cr><a-o>
""" Preview Only
nnoremap <silent> <a-o><a-p> :<c-u>Maps<cr><a-o>
nnoremap <silent> <a-o>p     :<c-u>Maps<cr><a-o>

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
  tnoremap <silent><buffer> <a-q> <c-l><c-\><c-n> :quit<cr>
  tnoremap <silent><buffer> <a-r> <c-l><c-\><c-n> :<c-u>Rg
endfunction


"""" GENERAL
""" Definition
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" [Buffers] Jump to existing window if possible.
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
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

"" Execute Selected Command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

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
