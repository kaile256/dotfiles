scriptencoding utf-8
" From: init.vim

" as default, <F1> do `:help`
inoremap <F1> <Nop>

" <c-o>
" Tips: <c-\><c-o> keeps cursor position
" TODO: keep the cursor after <c-o>, especially <c-o>yiw
" Note: default <c-o>yy only inserts yy w/o yank.
inoremap <c-o>y        <c-\><c-o>:call feedkeys("\<c-\>\<c-o>y", 'n')<cr>
inoremap <c-o><space>y <c-\><c-o>:call feedkeys("\<c-\>\<c-o>\"+y", 'n')<cr>
"inoremap <c-o>p <c-\><c-o>:call feedkeys("\<esc>]p`]a")<cr>

inoremap <script> <c-;> <SID>(newline-or-semicolon)
inoremap <script><expr> <SID>(newline-or-semicolon)
      \ getline('.') =~# '^\s*$' ? '<CR>' :
      \ getline('.') =~# ';\s*$' ? '<Esc>o' :
      \ '<SID>(append-semicolon)'
inoremap <SID>(append-semicolon)
      \ <C-g>u<C-o>:keepjumps norm! A;<C-o>`^<Right><CR>

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
inoremap <silent> <a-s> <Del>

inoremap <silent> <a-space> <esc>:call feedkeys("\<space>")<cr>
inoremap <silent> <a-\> <esc>:call feedkeys('\')<cr>

let s:alt_mappings = 'jklwebWEBftFTqQuUoOpxdcXDCy.~"#*,;/'''
for s:key in split(s:alt_mappings, '\ze')
  exe 'inoremap <silent> <a-'. s:key .'> <esc>:call feedkeys("'. s:key .'")<cr>'
endfor

unlet s:alt_mappings s:key
" i/a/o "{{{2
" <a-ai> could be just <left>/<right>, but I prefer <esc> before.
inoremap <a-I> <c-g>U<esc>I
inoremap <a-A> <c-g>U<End>
inoremap <a-a> <c-g>U<Right>
inoremap <a-i> <c-g>U<Left>
"inoremap <a-I> <c-g>U<esc>I
"inoremap <a-A> <c-g>U<esc>A
"inoremap <a-a> <c-g>U<esc>la
"inoremap <a-i> <c-g>U<esc>i

inoremap <a-h> <esc>

inoremap <a-c-r> <esc><c-r>
inoremap <a-Y>   <esc>y$

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
      \ '<c-space>': '+',
      \ '<space>': '+',
      \ '<c-v>': '+',
      \ "<c-'>": '"',
      \ "'": '"',
      \ }

inoremap <SID>(literal-paste) <c-g>u<c-r><c-p>
imap <c-r> <SID>(literal-paste)
for s:reg in keys(s:registers)
  exe 'imap <c-r>'. s:reg '<SID>(literal-paste)'. s:registers[s:reg]
endfor
unlet s:reg s:registers

" Undo Break; {{{1
inoremap <a-P> <c-g>u<esc>:call feedkeys('P')<cr>

"" Undo Break; New Line
"inoremap <c-j> <c-g>u<c-j>
"inoremap <c-m> <c-g>u<c-m>
" Undo Break; Backspace
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
" Undo Break; Put
"inoremap <c-r> <c-g>u<c-r>
"inoremap <c-x> <c-g>u<c-x>
" Undo Break; Insert Previously's
"inoremap <c-a> <c-g>u<c-a>
" Note: i_<c-@> sometimes behaves as :qa!
"inoremap <c-@> <c-g>u<c-@>
" Undo Break; Digraph
"inoremap <c-k> <c-g>u<c-k>
" Undo Break; Non-Digit
"inoremap <c-q> <c-g>u<c-q>
"inoremap <c-v> <c-g>u<c-v>


augroup AdditionalUndoBreakOnFileType "{{{
  au!
  au FileType html,markdown inoremap <buffer> , ,<c-g>u
  au FileType html,markdown inoremap <buffer> . .<c-g>u
  au FileType html,markdown inoremap <buffer> ! !<c-g>u
  au FileType html,markdown inoremap <buffer> ? ?<c-g>u
augroup END "}}}

" Time Stamp {{{1
" Ref: https://qiita.com/annyamonnya/items/97c5cb0cfa414b3592d7
" %Y: Year
" %m: Month in number
" %b: Month, like Apr, Nov
" %d: Date
" %H: Hour in 00-23
" %M: Minute in 00-59
" %S: Second in 00-60 (60 is leap second)
" %w: Day of the Week
"
" %F: %Y-%m-%d
" %D: %m/%d/%y
" %T: %H:%M:%S
" %X: ???
" %R: %M:%M
"
" %e: Date in  1..31 (a digit with a space)
" %k: Hour in 0..23
" %l: Hour in 0..12
" %-m: Month
" %-d: Date
" Mnemonic: Now
inoremap <silent> <c-r><c-n> <c-r>=strftime('%d %b %Y %H:%M')<cr>
" Mnemonic: Time
inoremap <silent> <c-r><c-t> <c-r>=strftime('%H:%M')<cr>
" Mnemonic: Date
inoremap <silent> <c-r><c-d> <c-r>=strftime('%d %b %Y')<cr>

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

