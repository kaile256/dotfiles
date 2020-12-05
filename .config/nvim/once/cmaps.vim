" From: init.vim
" Ref: cabbrs.vim
" Ref: commands.vim

cnoremap <C-v><Space> <lt>space>
cnoremap <C-v><C-Space> <lt>space>

" Use <C-f>/<C-b> mapped to <Right>/<Left> to select candidate.
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

cnoremap <silent> <a-space> <esc>:call feedkeys("\<space>")<cr>

" " Note: <c-k> enter digraph when mistyped
" cnoremap <silent> <c-k><a-k> <c-c>

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

  let to_wordend = matchstr(line[col:], '\v\W?\s*\w{-}\ze\W?')
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

" Shorcut: instant execution "{{{1
cnoremap <script> <a-m>  <SID>(execute-shortcut)
cnoremap <script> <a-cr> <SID>(execute-shortcut)
cnoremap <script> <a-j>  <SID>(execute-shortcut)

cnoremap <silent><expr> <SID>(execute-shortcut)
      \ (getcmdtype() ==# '=')
      \ ? '<C-\>e<SID>quick_execute()<CR><CR>'
      \ : '<C-\>e<SID>verbose_in_quickfix()<CR><CR>'

function! s:quick_execute() abort "{{{2
  let cmd = getcmdline()
  let cmd = substitute(cmd, '^\s*exe\%[cute](', '', 'e')
  return 'execute('. string(cmd) .')'
endfunction

function! s:verbose_in_quickfix() abort "{{{2
  if getcmdtype() !=# ':' | return | endif

  let cmd = getcmdline()
  if cmd =~# '^\s*[cl]expr\s\+execute('
    return "\<CR>"
  endif

  " if cmd !~# '^\s*:' && cmd =~# '^[a-z=]\+$'
  "   let cmd = 'set '. cmd
  " endi
  if cmd !~# 'verb\%[ose] '
    let cmd = 'verbose '. cmd
  endif
  return "lexpr execute(". string(cmd) .") \<bar> bot lopen"
endfunction

cnoremap <a-q> <c-f>

" Shortcut: instant window-assign {{{1
cnoremap <silent><expr> <a-t> <C-\>e<SID>assign_window('tab')<CR>
cnoremap <silent><expr> <a-v> <C-\>e<SID>assign_window('vert bot')<CR>
cnoremap <silent><expr> <a-s> <C-\>e<SID>assign_window('bot')<CR>
cnoremap <silent><expr> <a-e> <C-\>e<SID>assign_window('')<CR>

function! s:assign_window(mods) abort
  let line = getcmdline()

  let mods_list = [
        \ 'tab',
        \ 'vert\%[ical] bot\%[tright]',
        \ 'bot\%[tright]'
        \ ]

  for mods in mods_list
    let mods .= '\s\+'
    let line = substitute(line, mods, '', 'e')
  endfor

  let ret = a:mods .' '. line
  return ret
endfunction

cnoremap <A-u> <C-\>e<SID>toggle_case()<CR><CR>

function! s:toggle_case() abort
  let line = getcmdline()
  let ignore_list = [
        \ 'tab',
        \ 'vert\%[tical]',
        \ 'rightb\%[elow]',
        \ 'bo\%[tright]',
        \ 'bel\%[right]',
        \ 'lefta\%[bove]',
        \ 'abo\%[veleft]',
        \ 'to\%[pleft]',
        \ 'verb\%[ose]',
        \ 'com\%[mand]',
        \ ]

  let range = matchstr(line, '^\A\+')
  let line = substitute(line, range, '', 'e')

  let mods = ''
  for m in ignore_list
    let new_mods = matchstr(line, '^'. m .'\s*')
    let line = substitute(line, new_mods, '', 'e')
    let mods .= new_mods
  endfor

  let col = match(line, '^\A*\a')
  let prefix = col > 0 ? line[:col - 1] : ''
  let suffix = line[col + 1:]

  if line[col] =~# '\u'
    let ret = prefix .. tolower(line[col]) .. suffix
  else
    let ret = prefix .. toupper(line[col]) .. suffix
  endif

  let ret = range .. mods .. ret
  return ret
endfunction
