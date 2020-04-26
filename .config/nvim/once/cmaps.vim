" From: init.vim
" Ref: cabbrs.vim
" Ref: commands.vim

cnoremap <c-o> <c-d>

cnoremap <silent> <a-space> <esc>:call feedkeys("\<space>")<cr>

" " Note: <c-k> enter digraph when mistyped
" cnoremap <silent> <c-k><a-k> <c-c>

cnoremap <c-r><c-space> <c-r>+
cnoremap <c-r><space>   <c-r>+

" Note: <expr> work with lexima.
cnoremap <SID>(paste-visualized)
      \ <C-r>=getline("'<")[col("'<") - 1 : col("'>") - 1]<CR>
cnoremap <script> <c-r><c-v> <SID>(paste-visualized)

"cnoremap <expr> . <SID>here()

"function! s:here() abort "{{{1
" FIXME: sometimes causes error and return '-1'
"  if getcmdtype() !~# '[:= ]' | return '.' |  endif
"
"  let line = getcmdline()
"  let pos  = getcmdpos()
"  if line[pos - 2] ==# '('
"    if  line[pos - 1] ==# ')'
"      return "'.'"
"    endif
"
"    return "'.')"
"  endif
"
"  return '.'
"endfunction
"
" instant :verbose "{{{1
cnoremap <silent><expr> <a-m>  <SID>verbose_in_quickfix()
cnoremap <silent><expr> <a-cr> <SID>verbose_in_quickfix()
cnoremap <silent><expr> <a-j>  <SID>verbose_in_quickfix()
function! s:verbose_in_quickfix() abort "{{{2
  if getcmdtype() !=# ':' | return | endif

  let cmd = getcmdline()
  if cmd =~# '^\s*cexpr'
    return "\<CR>"
  endif

  " if cmd !~# '^\s*:' && cmd =~# '^[a-z=]\+$'
  "   let cmd = 'set '. cmd
  " endif
  if cmd !~# 'verb\%[ose] '
    let cmd = 'verbose '. cmd
  endif

  return "\<End>\<C-u>lexpr execute(". string(cmd) .") \<bar> lopen \<CR>"
endfunction

augroup myCmapsOnce
  if exists('#myCmapsOnce') | au! myCmapsOnce
  endif
  " FIXME: Close when the cursor is out of buffer.
  au QuickFixCmdPost lexpr :lopen | au WinLeave,BufLeave <buffer> :lclose
augroup END

cnoremap <a-q> <c-f>

" Open cmdwin {{{1
cnoremap <a-i> <c-f>i
cnoremap <a-a> <c-f>a
cnoremap <a-I> <c-f>I
cnoremap <a-A> <c-f>A

cnoremap <a-^> <c-f>^
cnoremap <a-0> <c-f>0
cnoremap <a-$> <c-f>$

" Style; emacs-like motions {{{1
" <a-j> for :verbose
cnoremap <a-h> <c-c>
cnoremap <a-k> <c-c>
cnoremap <a-l> <c-c>

cnoremap <c-a> <Home>
cnoremap <a-f> <S-Right>
cnoremap <c-f> <Right>
cnoremap <c-b> <Left>
cnoremap <a-b> <S-Left>

cnoremap <c-d> <Del>
" useless only to print <S-Del>

cnoremap <expr> <a-d> <SID>remove_to_wordend()
function! s:remove_to_wordend() abort
  " FIXME: find what is wrong.
  let line = getcmdline()
  let col  = getcmdpos() - 1

  let to_wordend = matchstr(line[col:], '.\{-}\ze\v(\W|$)')
  let len = len(to_wordend)
  return repeat("\<Del>", len)
endfunction

cnoremap <expr> <c-k> <SID>remove_to_end()
function! s:remove_to_end() abort
  let line = getcmdline()
  let col  = getcmdpos()
  let len  = len(line) - col + 1
  return repeat("\<Del>", len)
endfunction

" Style; vi-like to open cmdwin {{{1
"cnoremap <a-b> <c-f>B
"
" Note: no use below
"cnoremap <silent> <a-f> <c-f>:call feedkeys("\<esc>f")<cr>
"cnoremap <silent> <a-t> <c-f>:call feedkeys("\<esc>t")<cr>
"cnoremap <silent> <a-F> <c-f>:call feedkeys("\<esc>F")<cr>
"cnoremap <silent> <a-T> <c-f>:call feedkeys("\<esc>T")<cr>
