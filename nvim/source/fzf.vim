" From: finder.toml
" Repo: junegunn/fzf.vim
" Fork: kaile256/fzf.vim
" Another: add/fzf.vim
" Another: post/fzf.vim


" Note: :FZF! starts fzf on full-window.

augroup FzfMyAutoConf "{{{1
  au!
  function! s:fzf_buffer_statusline() "{{{2
    " Override statusline as you like
    hi fzf1 ctermfg=161 ctermbg=251
    hi fzf2 ctermfg=23  ctermbg=251
    hi fzf3 ctermfg=237 ctermbg=251
    setl statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
  endfunction "}}}2
  au User FzfStatusLine call <SID>fzf_buffer_statusline()
  " CAUTION: WinLeave's current file is next file, i.e., fzf when opening fzf-buffer.
  au WinLeave,BufLeave * if &ft ==# 'fzf' | hide
  " Note: Makes no sense but auto-set nonumber on tab-open.
  au FileType fzf setl laststatus=0
        \ | au BufEnter * ++once setl laststatus=2
        \ | if &l:number | setl number | endif
augroup END "}}}1

"let g:fzf_layout = { 'down': '~25%' }

"let g:fzf_command_prefix = 'Fzf' " makes complex hook on dein.
" Note: write in a string w/ no spaces, not in a list.
let g:fzf_commands_expect = 'ctrl-x,alt-x'

" TODO: implement g:vars below:
"let g:fzf_preview_excluded = ['history']
let g:fzf_preview_options = 'right:60%:wrap'
let g:fzf_default_options = '--multi --reverse'

" on Fzf Buffer; Action-Command {{{1
function! s:fzf_open_in_quickfix_list(lines) "{{{2
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction "}}}
" <alt-k> for cancel.
" Note: seems not work with <alt> like <alt-k>.
" bdelete/bwipeout work incorrect, lured to current buffer.
" badd: append the files to buflist in Background.
let g:fzf_action = {
      \ 'alt-a': 'argadd',
      \ 'alt-b': 'badd',
      \ 'alt-q': function('s:fzf_open_in_quickfix_list'),
      \ 'alt-s': 'split',
      \ 'alt-t': 'tab split',
      \ 'alt-v': 'vsplit',
      \ 'ctrl-z': '',
      \ }
" [Buffers] Rather Jump to window than just to open.
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_history_dir = '~/.local/share/fzf-history'
"" args: down/up/left/right

" on Fzf Buffer; Color Config {{{1
let g:fzf_colors =
      \ { 'fg':      ['fg', 'None'],
      \   'bg':      ['bg', 'None'],
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
"}}}

