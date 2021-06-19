scriptencoding utf-8
" From: init.vim

inoremap <C-v><Space> <lt>space>
inoremap <C-v><C-Space> <lt>space>

silent! inoremap <unique> <C-f> <C-g>U<Right>
silent! inoremap <unique> <C-b> <C-g>U<Left>

inoremap <C-d> <C-g>U<Del>
inoremap <C-g><C-d> <C-d>
inoremap <C-g><C-t> <C-t>

inoremap <C-g>D ^<C-d>
inoremap <C-o>D ^<C-d>


function! s:copy_line(key) abort
  let cur_lnum = line('.')
  let lnum = cur_lnum + 1

  if a:key ==# "\<C-y>"
    let lnum = cur_lnum - 1
  endif
  let line = getline(lnum)

  let cur_col = col('.')

  let pat_boundaries = '[^a-zA-Z0-9, ]*\s*'
  let pat_words = '\v(\d+|\l+|\u\l*|\u+\u@!\u|\W\s*)'
  let pat_to_stop = pat_boundaries . pat_words .'\ze'. pat_boundaries

  let cnt = matchstrpos(line[cur_col :], pat_to_stop)[2] + 1

  let seq = repeat(a:key, cnt)

  return seq
endfunction

inoremap <expr> <C-r><C-y> <SID>copy_line("\<lt>C-y>")
inoremap <expr> <C-r><C-e> <SID>copy_line("\<lt>C-e>")

function! s:jump_back(char) abort
  if search(a:char, 'bW')
    call feedkeys('i', 'n')
  else
    call feedkeys('gi', 'n')
  endif
endfunction

function! s:jump_out(char) abort
  if search(a:char, 'W')
    " let next_sequence = getline('.')[col('.'):]

    " if next_sequence ==# ''
    "   let chars = "\<space>"

    " elseif next_sequence =~# '^\s'
    "   let chars = "\<C-g>U\<Right>"
    "   if next_sequence[1:] !=# ''
    "     let chars = "\<C-g>U\<Right>\<space>\<C-g>U\<Left>"
    "   endif

    " else
    "   let chars = "\<space>"
    " endif

    call feedkeys('a', 'n')
    " call feedkeys('a'. chars, 'n')
  else
    call feedkeys('gi', 'n')
  endif
endfunction

inoremap <silent> <C-(>   <Esc>:call <SID>jump_back('[[({]') <CR>
" " doesn't matter to map to <Esc>?
" inoremap <silent> <C-[>   <Esc>:call <SID>jump_back('[') <CR>
" inoremap <silent> <C-S-[> <Esc>:call <SID>jump_back('{') <CR>

inoremap <silent> <C-)>   <Esc>:call <SID>jump_out('[\])}]') <CR>

" as default, <F1> do `:help`
inoremap <F1> <Nop>

" Tips: i_CTRL-\_CTRL-O keeps cursor position
function! s:remove_to_end() abort
  silent! call repeat#set('"_D')
  return repeat("\<Del>", max([col('$') - col('.'), 1]))
endfunction
inoremap <expr> <SID>(ctrl-k) <SID>remove_to_end()
imap <C-k> <SID>(ctrl-k)

" TODO: keep the cursor after <c-o>, especially <c-o>yiw
" Note: default <c-o>yy only inserts 'yy' w/o yank probably because the other
" mappings with :nmap to y like y<c-g>.
inoremap <silent> <c-o>y        <c-\><c-o>:call feedkeys("\<c-\>\<c-o>y", 'n')<cr>
inoremap <silent> <c-o><space>y <c-\><c-o>:call feedkeys("\<c-\>\<c-o>\"+y", 'n')<cr>
"inoremap <c-o>p <c-\><c-o>:call feedkeys("\<esc>]p`]a")<cr>

" TODO: Associate with lexima
" inoremap <script> <c-;> <SID>(newline-or-semicolon)
" inoremap <script><expr> <SID>(newline-or-semicolon)
"      \ getline('.') =~# '^\s*$' ? '<CR>' :
"      \ getline('.') =~# ';\s*$' ? '<Esc>o' :
"      \ '<SID>(append-semicolon)'
" inoremap <SID>(append-semicolon)
"      \ <C-g>u<C-o>:keepjumps norm! A;<C-o>`^<Right><CR>

" somtimes returns `-1` as an error
"inoremap <expr> . <SID>here()
"function! s:here() abort "{{{1
"  let line = getline('.')
"  if line =~# 'fu\%[nction]!' | return '.' | endif
"
"  if line[col('.') - 2] ==# '('
"    if line[col('.') - 1] ==# ')'
"      return "'.'"
"    endif
"
"    return "'.')"
"  endif
"
"  return '.'
"endfunction
"
" Alt-ESC {{{1
function! s:alt_mappings() abort
  function! s:alt_upper_mappings(key) abort
    " Use '<A-S-O>' instead of '<a-O>'; Vim put 'Ï' while Neovim '<Esc>O'.
    " exe 'set <A-S-'. a:key .'>='. a:key
    exe 'imap <silent> <A-S-'. a:key .'> <ESC>'. toupper(a:key)
    "exe 'imap <silent> <A-s-'. a:key .'> <esc>:call feedkeys("'. toupper(a:key) .'")<cr>'
  endfunction

  let alphabets = map(range(char2nr('a'), char2nr('z')), 'nr2char(v:val)')
  for key in alphabets
    call s:alt_upper_mappings(key)
  endfor

  let symbols = split('."#*,;/''', '\zs')
  for key in alphabets + symbols
    "exe 'imap <silent> <A-'. key .'> <esc>:call feedkeys("'. key .'")<cr>'
    exe 'imap <silent> <A-'. key .'> <ESC>'. key
  endfor
endfunction
call s:alt_mappings()
delfunction s:alt_mappings
delfunction s:alt_upper_mappings

inoremap <silent> <a-s> <Del>

" keep cursor in expected postition as mapleader of operator.
imap <A-~> <esc>l~
imap <A-g> <esc>lg
imap <A-\> <esc>l\
imap <A-space> <Esc>l<space>

" i/a/o "{{{2
" <a-ai> could be just <left>/<right>, but I prefer <esc> before.
inoremap <A-S-I> <c-g>U<esc>I
inoremap <A-S-A> <c-g>U<End>
inoremap <a-a> <c-g>U<Right>
inoremap <a-i> <c-g>U<Left>
"inoremap <a-I> <c-g>U<esc>I
"inoremap <a-A> <c-g>U<esc>A
"inoremap <a-a> <c-g>U<esc>la
"inoremap <a-i> <c-g>U<esc>i

" inoremap <a-h> <esc>

inoremap <A-C-r> <esc><c-r>
inoremap <A-S-Y> <esc>y$

" Register "{{{1
"function! s:paste() abort
"  let char = nr2char(getchar())
"  exe 'norm! "' char ']p`]a'
"endfunction

"inoremap <silent> <c-r> <c-g>u<c-o>:<c-u> call feedkeys("\<c-r>")<cr>
"inoremap <expr> <c-r> '<esc>"'.nr2char(getchar()).']p`]a'

"inoremap <silent> <c-r> <esc>:call <SID>paste()<cr>
"
"function! s:paste() abort
"  let nr = getchar()
"
"  "if index(s:reg_special, nr) >= 0
"  "  call feedkeys("\<c-r>". nr2char(nr), 'n')
"  "  return
"  "endif
"
"  let regname = get(s:reg_dict, nr, nr2char(nr))
"
"  startinsert
"  call feedkeys("\<c-r>\<c-p>". regname, 'n')
"
"  "exe 'norm! "'. regname .']p`]'
"  "call feedkeys('a', 'n')
"endfunction
"
"let s:reg_dict = {
"      \ '<t_ü>0': 0,
"      \
"      \ '<t_ü> ': '+',
"      \ '32': '+',
"      \
"      \ '<t_ü>;': ':',
"      \
"      \ "<t_ü>'": '"',
"      \ '39': '"',
"      \ '92': '"',
"      \ '28': '"',
"      \ }
"
"" 64, '=': the expression register
"" 'insert literally' includes, e.g., '' when <BS> was typed in register
"" 18, '<c-r>': insert literally; 'textwidth', 'formatoptions', etc. still apply
"" 15, '<c-o>': insert literally, but no auto-indent;
""   insert above, when register is linewise, like with `P`
"" 16, '<c-p>': insert literally and fix indent
"let s:reg_special = [
"      \ '61', '<t_ü>=',
"      \ '18',
"      \ '16',
"      \ '15',
"      \ ]

" '=': the expression register
" 'insert literally' includes, e.g., '' when <BS> was typed in register
" '<c-r>': insert literally; 'textwidth', 'formatoptions', etc. still apply
" '<c-o>': insert literally, but no auto-indent;
"   insert above, when register is linewise, like with `P`
" '<c-p>': insert literally and fix indent
let s:registers = {
      \ '<c-0>': '0',
      \ '<c-;>': ':',
      \ ';': ':',
      \ '<C-Space>': '*',
      \ '<space>': '+',
      \ "<c-'>": '"',
      \ "'": '"',
      \ }

function! s:paste(...) abort
  const reg_key = a:0 ? a:1 : ''
  set paste
  autocmd TextChangedI * ++once set nopaste
  return "\<C-g>u\<C-r>". reg_key
endfunction
imap <expr> <C-r> <SID>paste()
for s:reg in keys(s:registers)
  exe 'imap <expr> <C-r>'. s:reg '<SID>paste(' string(s:registers[s:reg]) ')'
endfor
unlet s:reg s:registers

" Undo Break; {{{1
imap <A-p>   <C-g>u<Esc>p
imap <A-S-P> <C-g>u<Esc>P

augroup myImapsOnce
  au FileType html,markdown inoremap <buffer> , ,<c-g>u
  au FileType html,markdown inoremap <buffer> . .<c-g>u
  au FileType html,markdown inoremap <buffer> ! !<c-g>u
  au FileType html,markdown inoremap <buffer> ? ?<c-g>u
augroup END

" NewLine Adjustment "{{{1
" too slow
"inoremap <silent> <Plug>(adjust-newline) <esc>:<c-u>call <SID>adjust_newline()<cr>
"
"function! s:adjust_newline() abort
"  let max_col = -1
"
"  if getbufvar(bufnr('%'), '&colorcolumn') > 0
"    let max_col = &colorcolumn - 1
"  elseif getbufvar(bufnr('%'), '&textwidth') > 0
"    let max_col = &textwidth
"  endif
"
"  if max_col >= 0 && col('.') + 1 > max_col
"    exe "norm! Bi\<CR>"
"  endif
"
"  exe "norm! a\<CR>"
"  startinsert
"endfunction
"
"imap <c-j> <Plug>(adjust-newline)
"imap <c-m> <Plug>(adjust-newline)

