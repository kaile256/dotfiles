" From: browse.toml
" Repo: junegunn/fzf.vim
" Another: add/fzf.vim
" Another: post/fzf.vim

if exists('g:loaded_fzf')
  unlet g:loaded_fzf
endif

" Note: :FZF! starts fzf on full-window.
if has('nvim')
  let g:fzf_layout = {'window': 'call my#floating_window()'}
else
  " Possible keys: width, height, xoffset, yoffset, border
  let g:fzf_layout = {'window': {
        \ 'width':     0.94,
        \ 'height':    0.95,
        \ 'border':    'right',
        \ 'highlight': 'NormalFloat',
        \ }}
endif

"let g:fzf_command_prefix = 'Fzf' " makes complex hook on dein.
" Note: write in a string w/ no spaces, not in a list.
let g:fzf_commands_expect = 'ctrl-x,alt-x'

" on Fzf Buffer; Action-Command {{{1
function! s:list_in_quickfix(lines) "{{{2
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction "}}}

function! s:fzf_yank_fullpath(lines) abort "{{{1
  let @+ = join(map(a:lines, "fnamemodify(v:val, ':p')"))
endfunction

" Note: Currently, g:fzf_action has nothing to do with :Rg.
" <alt-k> for cancel.
" Note: seems not work with <alt> like <alt-k>.
" bdelete/bwipeout work incorrect, lured to current buffer.
" verbose: Who defined it?
" badd: append the files in Old buffers.
let g:fzf_action = {
      \ 'alt-a': 'argadd',
      \ 'alt-l': 'source',
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
if executable('bat')
  " The preview color including its cursorline determined by previewer.
  let $FZF_PREVIEW_COMMAND = "COLORTERM=truecolor bat --theme 'Coldark-Dark' --style=numbers --color=always {}"
endif

let g:fzf_colors = {
      \ 'fg':      ['fg', 'None'],
      \ 'bg':      ['bg', 'None'],
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
      \ 'header':  ['fg', 'Comment']
      \ }

function! s:diff_width() abort
  let default = 80
  let preview_args = get(g:, 'fzf_preview_window', [])
  if len(preview_args) == 0
    return default
  endif

  if len(filter(deepcopy(preview_args), 'v:val =~# "\\v(top|bottom)"'))
    return &columns
  endif

  let opt_width = filter(deepcopy(preview_args), 'v:val =~# "\\v(left|right)"')
  if len(opt_width) == 0
    return default
  endif

  let width = matchstr(opt_width[0], '\d\+%\?')
  if width ==# ''
    return default
  endif

  if width =~# '%'
    let width = &columns * str2nr(matchstr(width, '\d\+')) / 100
  endif
  return width
endfunction

augroup myFzfSource "{{{1
  function! s:resize_preview_window() abort
    let g:fzf_preview_window =
          \   &columns < 170 ? ['right:85:hidden', 'ctrl-]']
          \ : &columns < 200 ? ['right:50%', 'ctrl-]']
          \                  : ['right:60%', 'ctrl-]']
  endfunction
  call s:resize_preview_window()
  au VimResized * call s:resize_preview_window()

  function! s:fzf_buffer_keymaps() abort "{{{1
    nnoremap <buffer> <c-f> i<PageDown><c-\><c-n>
    nnoremap <buffer> <c-b> i<PageUp><c-\><c-n>
  endfunction "}}}
  "au User FzfStatusLine call feedkeys('!.git !node_modules ')
  au User FzfStatusLine call s:fzf_buffer_keymaps()

  au User FzfStatusLine let $FZF_PREVIEW_COLUMNS = s:diff_width()

  au WinLeave term://*#FZF if &ft ==# 'fzf' | quit | endif
augroup END
