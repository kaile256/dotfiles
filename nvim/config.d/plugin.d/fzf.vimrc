"""" Info: https://github.com/junegunn/fzf.vim
"""" Help: fzf-vim
"""" From: Initial.toml


command! -bang -nargs=? -complete=dir BFiles
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('down:60%')
      \           : fzf#vim#with_preview('right:50%'),
      \   <bang>0)

"""" KEYBIND
""" Insert Mode
"" Mnemonic: File-path
imap <c-f> <plug>(fzf-complete-path)
" Too Slow to Acivate Ag
"imap <c-g> <plug>(fzf-complete-file-ag)


""" Open on a Pane
nmap <a-x> <plug>(fzf-maps-n)
" :FZF! starts fzf on full-window.
nnoremap <silent> <a-f>      :<c-u>FZF<cr>
nnoremap <silent> <a-f><a-f> :<c-u>FZF<cr>
nnoremap <silent> <a-f>o     :<c-u>FZF<cr>
nnoremap <silent> <a-f><a-b> :<c-u>Buffers<cr>
nnoremap <silent> <a-f>b     :<c-u>Buffers<cr>
nnoremap <silent> <a-f><a-h> :<c-u>Helptags<cr>
nnoremap <silent> <a-f>h     :<c-u>Helptags<cr>
nnoremap <silent> <a-f><a-w> :<c-u>Windows<cr>
nnoremap <silent> <a-f>w     :<c-u>Windows<cr>
"" Useless?  nnoremap <silent> <a-f><a-m> :<c-u>Marks<cr>
nnoremap <silent> <a-f>m     :<c-u>Marks<cr>
nnoremap <silent> <a-f><a-l> :<c-u>BLines<cr>
nnoremap <silent> <a-f>l     :<c-u>BLines<cr>

"" Search
nnoremap <silent> <a-f><a-/> :<c-u>History/<cr>
nnoremap <silent> <a-f>/     :<c-u>History/<cr>
nnoremap <silent> <a-f><a-;> :<c-u>History:<cr>
nnoremap <silent> <a-f>;     :<c-u>History:<cr>
""" Preview Only
nnoremap <silent> <a-f><a-p> :<c-u>Maps<cr>
nnoremap <silent> <a-f>p     :<c-u>Maps<cr>

if executable('ag')
  nnoremap <silent> <a-f><a-a> :<c-u>Ag<cr>
  nnoremap <silent> <a-f>a     :<c-u>Ag<cr>
endif
if executable('rg')
  nnoremap <silent> <a-f><a-r> :<c-u>Rg<cr>
  nnoremap <silent> <a-f>r     :<c-u>Rg<cr>
endif

"augroup FzfBuffer
"  au! FileType fzf setlocal noshowmode
"  "" Quich Change
"  au! FileType fzf call s:fzf_keymap()
"augroup END
"
"function! s:fzf_keymap()
"  "" Quit
"  " <a-k> is for pane-leap.
"  tnoremap <silent><buffer> <a-b> <c-l><c-\><c-n> :<c-u>Buffers<cr>
"  tnoremap <silent><buffer> <a-c> <c-l><c-\><c-n> :<c-u>Colors<cr>
"  tnoremap <silent><buffer> <a-h> <c-l><c-\><c-n> :<c-u>Helptags<cr>
"  tnoremap <silent><buffer> <a-/> <c-l><c-\><c-n> :<c-u>History/<cr>
"  tnoremap <silent><buffer> <a-;> <c-l><c-\><c-n> :<c-u>History:<cr>
"  tnoremap <silent><buffer> <a-f> <c-l><c-\><c-n> :<c-u>History<cr>
"  tnoremap <silent><buffer> <a-m> <c-l><c-\><c-n> :<c-u>Marks<cr>
"  tnoremap <silent><buffer> <a-p> <c-l><c-\><c-n> :<c-u>Maps<cr>
"  tnoremap <silent><buffer> <a-q> <c-l><c-\><c-n> :quit<cr>
"  tnoremap <silent><buffer> <a-r> <c-l><c-\><c-n> :<c-u>Rg
"endfunction


"""" GENERAL
""" Definition
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

"""" GENERAL
autocmd! User FzfStatusLine call <SID>fzf_statusline()

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

"" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \   'bg':      ['bg', 'Normal'],
      \   'hl':      ['fg', 'Comment'],
      \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \   'hl+':     ['fg', 'Statement'],
      \   'info':    ['fg', 'PreProc'],
      \   'border':  ['fg', 'Ignore'],
      \   'prompt':  ['fg', 'Conditional'],
      \   'pointer': ['fg', 'Exception'],
      \   'marker':  ['fg', 'Keyword'],
      \   'spinner': ['fg', 'Label'],
      \   'header':  ['fg', 'Comment'] }
