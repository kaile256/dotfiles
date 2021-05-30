" From: init.vim

" makes <c-o>u work as if <c-u>
"nnoremap o o<c-g>u
"nnoremap O O<c-g>u

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" TODO: make it work
"xnoremap <silent> gJ :*g/^\( \\|\t\)/norm! 0"_dwgJ<cr>

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
  let shim = ' '
  call s:_operator_join(a:wise, shim)
endfunction

function! s:operator_gJ(wise) abort
  let shim = ''
  call s:_operator_join(a:wise, shim)
endfunction

function! s:set_range(mode) abort
  let range = a:mode =~? "[v\<C-v>]"
        \ ? [line("'<"), line("'>")]
        \ : [line("'["), line("']")]
  return sort(range, 'n')
endfunction

function! s:_operator_join(wise, shim) abort
  let [above, below] = s:set_range(a:wise)
  if below - above <= 0 | return | endif

  let lines = getline(above, below)
  exe above ',' below 'delete _'

  let cms = &cms
  if cms =~# '%s'
    " Trim comment indicator only if the previous line ends with a comment
    " string; otherwise, just join lines leaving comment indicators.
    let indicator = split(cms, '%s')[0]
    let pat_comment_start =
          \ '\%('. indicator .'.*\)\@<!'
          \ . indicator .
          \ '\%(.*'. indicator .'\)\@!'
    let new_lines = [ lines[0] ]
    for idx in range(1, len(lines) - 1)
      let is_prev_also_comment = lines[idx - 1] =~# pat_comment_start
      let new_lines += is_prev_also_comment
            \ ? [ substitute(lines[idx], pat_comment_start, '', '') ]
            \ : [ substitute(lines[idx], '^\s*', '', '') ]
    endfor
    let lines = new_lines
  endif

  if &ft ==# 'vim'
    let pat_line_continuation_for_vim = '^\s*\\\s*'
    let Join_continued_lines = 'substitute(v:val, pat_line_continuation_for_vim, "", "")'
    let lines = [ lines[0] ] + map(lines[1:], Join_continued_lines)
  endif
  let pat_line_continuation_for_sh = '\s*\\\s*$'
  let Join_continued_lines = 'substitute(v:val, pat_line_continuation_for_sh, "", "")'
  let lines = map(lines[: -2], Join_continued_lines) + [ lines[-1] ]

  let lines = filter(lines, 'v:val !~# "^\\s*$"')
  let indent = matchstr(lines[0], '^\s*')
  let lines = map(lines, 'matchstr(v:val, ''^\s*\zs.\{-}\ze\s*$'')')

  let line = indent . join(lines, a:shim)

  let put = above == line('$') + 1 ? 'put' : 'put!'
  exe put '= [ line ]'
endfunction
