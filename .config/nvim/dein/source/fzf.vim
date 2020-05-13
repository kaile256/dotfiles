" From: browse.toml
" Repo: junegunn/fzf.vim
" Fork: kaile256/fzf.vim
" Another: add/fzf.vim
" Another: post/fzf.vim

if exists('g:loaded_fzf')
  unlet g:loaded_fzf
endif

" Note: :FZF! starts fzf on full-window.
if has('nvim')
  let g:fzf_layout = {'window': 'call my#floating_window()'}
else
  let g:fzf_layout = {'window': {'width': 0.94, 'height': 0.95, 'border': 'right'}}
endif

"let g:fzf_command_prefix = 'Fzf' " makes complex hook on dein.
" Note: write in a string w/ no spaces, not in a list.
let g:fzf_commands_expect = 'ctrl-x,alt-x'

" Original
" TODO: implement g:vars below:
"let g:fzf_preview_excluded = ['history']
let g:fzf_default_options = '--multi --reverse'
let g:fzf_extract_pattern = '^.git$'
let g:fzf_preview_default_style = 'right:60%:wrap'

" on Fzf Buffer; Action-Command {{{1
function! s:list_in_quickfix(lines) "{{{2
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction "}}}

function! s:fzf_yank_fullpath(lines) abort "{{{1
  let @+ = join(map(a:lines, "fnamemodify(v:val, ':p')"))
endfunction

" <alt-k> for cancel.
" Note: seems not work with <alt> like <alt-k>.
" bdelete/bwipeout work incorrect, lured to current buffer.
" verbose: Who defined it?
" badd: append the files in Old buffers.
let g:fzf_action = {
      \ 'alt-a': 'argadd',
      \ 'alt-l': 'source',
      \ 'alt-o': 'bel split',
      \ 'alt-p': 'vert bot pedit',
      \ 'alt-q': function('s:list_in_quickfix'),
      \ 'alt-s': 'bel split',
      \ 'alt-t': 'tab split',
      \ 'alt-v': 'bot vsplit',
      \ 'alt-w': 'verbose',
      \ 'alt-y': function('s:fzf_yank_fullpath'),
      \ 'ctrl-z': "\<Nop>",
      \ }

" [Buffers] Rather Jump to edited buffer than to open as another
let g:fzf_buffers_jump = 0
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

if exists('#myFzfSource')
  au! myFzfSource
endif
augroup myFzfSource "{{{1
  function! s:fzf_buffer_statusline() "{{{
    " Override statusline as you like
    hi fzf1 ctermfg=161 ctermbg=251
    hi fzf2 ctermfg=23  ctermbg=251
    hi fzf3 ctermfg=237 ctermbg=251
    setl statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
  endfunction "}}}
  au User FzfStatusLine call s:fzf_buffer_statusline()
  function! s:fzf_buffer_keymaps() abort "{{{1
    nnoremap <buffer> <c-f> i<PageDown><c-\><c-n>
    nnoremap <buffer> <c-b> i<PageUp><c-\><c-n>
  endfunction "}}}
  "au User FzfStatusLine call feedkeys('!.git !node_modules ')
  au User FzfStatusLine call s:fzf_buffer_keymaps()

  "au BufWinEnter * if &ft ==# 'fzf' | runtime once/terminal
  " CAUTION: WinLeave's current file is next file, i.e., fzf when opening fzf-buffer.
  " Note: 'bufhidden' is useless for fzf.
  "au FileType fzf setl bufhidden=wipe
  " Note: both :quit and :close causes errors instead.
  au WinLeave,BufLeave * if &ft ==# 'fzf' | hide | silent! !killall fzf
  " Note: Makes no sense but auto-set nonumber on tab-open.
  "au FileType fzf setl laststatus=0
  "      \ | au BufEnter * ++once setl laststatus=2
  "      \ | if &l:number | setl number | endif
augroup END
