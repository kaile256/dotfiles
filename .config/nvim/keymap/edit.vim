" From: init.vim

" makes <c-o>u work as if <c-u>
"nnoremap o o<c-g>u
"nnoremap O O<c-g>u

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap 0 g0
nnoremap $ g$
nnoremap g0 0
nnoremap g$ $

onoremap 0 g0
onoremap $ g$
onoremap g0 0
onoremap g$ $

" TODO: make it work
"xnoremap <silent> gJ :*g/^\( \\|\t\)/norm! 0"_dwgJ<cr>

" Macro "{{{1
nnoremap \<space> q
nnoremap <space>\ q

" Write&Quit {{{1
if mapcheck('q', 'n') ==# ''
  nnoremap q <Nop>
endif
if mapcheck('Q', 'n') ==# ''
  nnoremap Q <Nop>
endif
" Write&Quit; wq
nnoremap <silent><expr> <space>w
      \ ':<C-u>'. (&modified ? 'up' : 'checktime') .'<CR>'
nnoremap <silent> g<space>w :<C-u>call <SID>windo_update()<CR>

function! s:windo_update() abort
  let id = win_getid()
  exe 'windo' (&modified ? 'up' : 'checktime')
  call win_gotoid(id)
endfunction

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

" Join without line-continuation symbols {{{1

nnoremap <silent> <SID>(operator-J)  :<C-u>set  operatorfunc=<SID>operator_J<CR>g@
nnoremap <silent> <SID>(operator-gJ) :<C-u>set  operatorfunc=<SID>operator_gJ<CR>g@
xnoremap <silent> <SID>(modified-J)  :<C-u>call <SID>operator_J('visual')<CR>
xnoremap <silent> <SID>(modified-gJ) :<C-u>call <SID>operator_gJ('visual')<CR>

nmap <space>J <SID>(operator-J)
nmap gJ <SID>(operator-gJ)
xmap <space>J <SID>(modified-J)
xmap gJ <SID>(modified-gJ)

function! s:operator_J(wise) abort
  let range = s:set_range(a:wise)
  call s:_operator_join('join', range)
endfunction

function! s:operator_gJ(wise) abort
  let [line1, line2] = s:set_range(a:wise)

  function! s:trim_indents() abort closure
    let lnum_to_trim = line1 + 1
    let range = lnum_to_trim < line2
          \ ? lnum_to_trim .','. line2
          \ : line2 .','. lnum_to_trim
    exe 'keeppatterns keepjumps' range 's/^\s*//ge'
  endfunction
  call s:trim_indents()

  call s:_operator_join('join!', [line1, line2])
endfunction

function! s:set_range(mode) abort
  return sort(
        \ a:mode =~? "[v\<C-v>]"
        \ ? [line("'<"), line("'>")]
        \ : [line("'["), line("']")]
        \ )
endfunction

function! s:_operator_join(join, range) abort
  let [line1, line2] = a:range
  let sh_like = ['sh', 'zsh', 'fish', 'dockerfile', 'python']
  const keep = 'keeppatterns keepjumps'

  if &ft ==# 'vim'
    let line = max([line1 + 1, line2])
    let range = line < line2 ? line .','. line2 : line2 .','. line
    let line_continuation_for_vim = '^\s*\\\s*'
    exe keep range 's/'. line_continuation_for_vim .'//ge'
  elseif &ft =~# join(sh_like, '\|')
    let line = max([line2 - 1, line1])
    let range = line < line2 ? line .','. line2 : line2 .','. line
    let line_continuation_for_sh = '\s*\\\s*$'
    exe keep range 's/'. line_continuation_for_sh .'//ge'
  endif

  let range = line1 < line2 ? line1 .','. line2 : line2 .','. line1
  exe range a:join
endfunction
