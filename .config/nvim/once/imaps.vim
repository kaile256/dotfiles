" From: init.vim

" as default, <F1> do `:help`
inoremap <F1> <Nop>

inoreabbr donw down
inoreabbr markdonw markdown

" <c-o>
" Tips: <c-\><c-o> keeps cursor position
" TODO: keep the cursor after <c-o>, especially <c-o>yiw
" Note: default <c-o>yy only inserts yy w/o yank.
inoremap <c-o>y        <c-\><c-o>:call feedkeys("\<c-\>\<c-o>y", 'n')<cr>
inoremap <c-o><space>y <c-\><c-o>:call feedkeys("\<c-\>\<c-o>".'"+y', 'n')<cr>
"inoremap <c-o>p <c-\><c-o>:call feedkeys("\<esc>]p`]a")<cr>

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
" %Y: year
" %b: month, like Apr, Nov
" %d: date
" %H: hour
" %M: minute
" Mnemonic: Now
inoremap <silent> <c-r><c-n> <c-r>=strftime('%d %b %Y %H:%M')<cr>
" Mnemonic: Time
inoremap <silent> <c-r><c-t> <c-r>=strftime('%H:%M')<cr>
" Mnemonic: Date
inoremap <silent> <c-r><c-d> <c-r>=strftime('%d %b %Y')<cr>
