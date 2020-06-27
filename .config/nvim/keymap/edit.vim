" From: init.vim

" makes <c-o>u work as if <c-u>
"nnoremap o o<c-g>u
"nnoremap O O<c-g>u

nnoremap <silent> <C-x> :<C-u>call <SID>increment_index("\<C-x>")<CR>
nnoremap <silent> <C-a> :<C-u>call <SID>increment_index("\<C-a>")<CR>
xnoremap <silent> <C-x> :call <SID>increment_index("\<C-x>")<CR>
xnoremap <silent> <C-a> :call <SID>increment_index("\<C-a>")<CR>
function! s:find_index() abort
  let save_view = winsaveview()
  " Return true if cursor is on the very position that escaped alphabet char.
  if searchpos('\\\zs\a', 'cWn') == [save_view['lnum'], save_view['col'] + 1]
    return 1
  endif

  " Regard those chars that beside underscore ('_') as isolated.
  "
  " List of chars to be ignored even when they look isolated:
  "     1. escaped by a backslash ('\')
  "     2. modifier prefix like, 'C' in '<C-x>' or 'A' in <A-j>'
  "     3. prefix for variables' scope of Vimscript like g:, s:, l:
  let pat_isolated = '\v\d|((<([\<\\])@<!|_\zs)\a:@!(\ze_|>))'
  " Set cursor to an index char/number if it's found in the cursor line;
  " otherwise, get back to the saved position.
  if search(pat_isolated, 'cW') != save_view['lnum']
    call winrestview(save_view)
    if search(pat_isolated, 'cWb') != save_view['lnum']
      call winrestview(save_view)
      return 0
    endif
  endif
  return 1
endfunction

function! s:increment_index(cmd) abort
  if !s:find_index() | return | endif

  let save_nrformats = &nrformats
  set nrformats=alpha
  exe 'norm!' v:count1 .. a:cmd
  let &nrformats = save_nrformats
endfunction

nnoremap j gj
nnoremap k gk
" switch mapping.
nnoremap gj j
nnoremap gk k

" TODO: make it work
"xnoremap <silent> gJ :*g/^\( \\|\t\)/norm! 0"_dwgJ<cr>

" Macro "{{{1
nnoremap \<space> q
nnoremap <space>\ q

" Write&Quit {{{1
if mapcheck('q', 'n') == ''
  nnoremap q <Nop>
endif
if mapcheck('Q', 'n') == ''
  nnoremap Q <Nop>
endif
" Write&Quit; wq
nnoremap <silent> <space>w :<c-u>w  <cr>
nnoremap <silent> <space>W :<c-u>w! <cr>
" Note: <space>q is sometimes mistyped, intending <space>w.
nnoremap <silent> <space>q :<c-u>w  <cr>
" Note: :undojoin causes an error just after :undo.
" TODO: :undojoin on :w prevents to go back undo-history
"nnoremap <silent> <space>w :<c-u>silent! undojoin <bar> w  <bar>silent! undojoin<cr>
"nnoremap <silent> <space>W :<c-u>silent! undojoin <bar> w! <bar>silent! undojoin<cr>
"" Note: <space>q is sometimes mistyped, intending <space>w.
"nnoremap <silent> <space>q :<c-u>silent! undojoin <bar> w  <bar>silent! undojoin<cr>

" Improve; i_<c-o> {{{1
" TODO: make <c-o>yi work, as <c-o>di, <c-o>ci.
"inoremap <c-o>y <esc>
"      \ :au TextYankPost * ++once norm! gi<cr>
"      \ y

" Cancel {{{2
onoremap <silent> <a-h> <ESC>:call feedkeys('h')<cr>
onoremap <silent> <a-j> <ESC>:call feedkeys('j')<cr>
onoremap <silent> <a-k> <ESC>:call feedkeys('k')<cr>
onoremap <silent> <a-l> <ESC>:call feedkeys('l')<cr>

" Fold; Uniquely Open Fold {{{1
" i.e., close all the others
noremap zU zMzv
