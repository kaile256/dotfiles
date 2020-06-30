" From: init.vim

" makes <c-o>u work as if <c-u>
"nnoremap o o<c-g>u
"nnoremap O O<c-g>u

nnoremap <silent> <Plug>(index-decrement) :<C-u>call <SID>increment_index("\<C-x>")<CR>
nnoremap <silent> <Plug>(index-increment) :<C-u>call <SID>increment_index("\<C-a>")<CR>
xnoremap <silent> <Plug>(index-decrement) :call <SID>increment_index("\<C-x>")<CR>
xnoremap <silent> <Plug>(index-increment) :call <SID>increment_index("\<C-a>")<CR>

nmap <C-x> <Plug>(index-decrement)
nmap <C-a> <Plug>(index-increment)
xmap <C-x> <Plug>(index-decrement)
xmap <C-a> <Plug>(index-increment)

function! s:find_index() abort
  let save_view = winsaveview()
  " Return true if cursor is on the very position that escaped alphabet char.
  if searchpos('\\\zs\a', 'cWn') == [save_view['lnum'], save_view['col'] + 1]
    return getline('.')[col('.') - 0]
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
      return ''
    endif
  endif
  " Exclude characters after current column to get pattern.
  return matchstr(getline('.')[:col('.') - 1], pat_isolated .'$')
endfunction

function! s:increment_index(cmd) abort
  let target = s:find_index()
  if target ==# '' | return | endif
  if target =~# '\d\+'
    exe 'norm!' a:cmd
    return
  endif

  if a:cmd ==# "\<C-x>"
    let op = '-'
    silent! call repeat#set("\<Plug>(index-decrement)")
  elseif a:cmd ==# "\<C-a>"
    let op = '+'
    silent! call repeat#set("\<Plug>(index-increment)")
  else
    echoerr '[Increment Index] Invalid argument:' a:cmd
    return
  endif

  if target =~# '\a'
    let save_nrformats = &nrformats
    set nrformats=alpha
    exe 'norm!' v:count1 .. a:cmd
    let &nrformats = save_nrformats
    return
  endif

  " TODO: Implement pattern in s:find_index()
  " Ref: Increment any other characters than ascii.
  " https://github.com/monaqa/dotfiles/blob/32f70b3f92d75eaab07a33f8bf28ee17927476e8/.config/nvim/init.vim#L950-L960
  let save_eventignore = &eventignore
  set eventignore=TextChangedI,TextYankPost,InsertEnter,InsertEnter
  let @/ = target
  let num = char2nr(target)
  exe 'norm! cgn'. nr2char(eval(num .. op .. v:count1))
  call histdel('/', -1)
  let &eventignore = save_eventignore
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
nnoremap <silent> <space>w :<c-u>up  <cr>
nnoremap <silent> <space>W :<c-u>up! <cr>
" Note: <space>q is sometimes mistyped, intending <space>w.
nnoremap <silent> <space>q :<c-u>up  <cr>
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
