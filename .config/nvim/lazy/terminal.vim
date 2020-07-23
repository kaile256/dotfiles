" From: init.vim
" Another: tmaps.vim
" Another: keymap/open_terminal.vim

if &bt !=# 'terminal' | finish | endif

syn match yayPkgAur 'aur/\zs\S*'
syn match yayPkgCommunity 'community/\zs\S*'
syn match yayPkgExtra 'extra/\zs\S*'
syn match yayPkgInstalled '(\zsInstalled\ze.*)'

hi! link yayPkgAur Identifier
hi! link yayPkgCommunity Title
hi! link yayPkgExtra     Statement
hi! link yayPkgInstalled Statement

syn match yayInstalling 'Installing \zs.*\ze\.\.\.'
hi! link yayInstalling Title

function! s:is_in_promptline() abort
  let pat_prompt_line = '.*\%#.*\n*\%$'
  let is_in_promptline = line('.') == search(pat_prompt_line, 'bcnW', line('w0'))
  return is_in_promptline
endfunction

function! s:is_modifeir_key_disallowed() abort
  let pat_prompts = [
        \ 'y\%[es]/n\%[o]',
        \ '==> \[N]one \[A]ll \[Ab]ort \[I]nstalled \[No]tInstalled.*\(\n==>\)\?',
        \ '^Enter .*:',
        \ ]
  let pat_installing = [
        \ '\d\+%$',
        \ ]
  let pattern = pat_prompts + pat_installing
  let pat_not_to_insert = '\('. join(pattern, '\|') .'\)'
  if getline('.') !=# ''
    let pat_not_to_insert .= '.*\n*\%$'
  endif
  let must_not_insert = search(pat_not_to_insert, 'bcnW')

  return must_not_insert
endfunction

function! s:start_insert(key_seq) abort
  let Startinsert = 'i'
  if !s:is_in_promptline() || s:is_modifeir_key_disallowed()
    return Startinsert
  endif

  " FIXME: Hopefully check if spaces are actually inserted or not, between pair
  " of prompts.
  let col_end_insertable = col('$')
  let len = col_end_insertable - col('.')
  if a:key_seq ==# 'a'
    let len -= 1
  endif
  let Startinsert = "i\<End>". repeat("\<Left>", len)

  if a:key_seq ==# 'a'
    return Startinsert
  endif
  return Startinsert .. a:key_seq
endfunction

function! s:attach(key_seq, ...) abort
  let offset = a:0 > 0 ? a:1 : 0
  let [_, save_lnum, save_col, _, _] = getcurpos()
  return s:start_insert(a:key_seq) ."\<C-\>\<C-n>"
        \ .":\<C-u>call cursor(". save_lnum .','. (save_col + offset) .")\<CR>"
endfunction

nnoremap <buffer> gi i
nnoremap <buffer> o i

nnoremap <expr><buffer> i <SID>start_insert('')
nnoremap <expr><buffer> a <SID>start_insert('a')

nnoremap <expr><buffer> s <SID>start_insert("\<Del>")
nnoremap <expr><buffer> S <SID>start_insert("\<BS>")
nnoremap <expr><buffer><silent> x <SID>attach("\<Del>")
nnoremap <expr><buffer><silent> X <SID>attach("\<BS>", -1)

nnoremap <expr><buffer> C <SID>start_insert("\<C-k>")

nnoremap <buffer> I i<Home>
" Note: <End> could complete cmdline on fish.
nnoremap <buffer> A i<End>

function! s:truncate_register() abort
  return substitute(getreg(v:register), '^\s*', '', '')
endfunction
nnoremap <buffer><expr> p
      \ <SID>is_modifeir_key_disallowed() ? 'p' :
      \ <SID>is_in_promptline()
      \ ? <SID>start_insert("\<Right>". getreg(v:register) ."\<C-\>\<C-n>")
      \ : "i". <SID>truncate_register() ." \<C-\>\<C-n>"
nnoremap <buffer><expr> P
      \ <SID>is_modifeir_key_disallowed() ? 'P' :
      \ <SID>is_in_promptline()
      \ ? <SID>start_insert(getreg(v:register) ."\<C-\>\<C-n>")
      \ : "i". <SID>truncate_register() ."\<C-\>\<C-n>"

nnoremap <buffer> d <c-d>
nnoremap <buffer> u <c-u>

nnoremap <buffer> D <c-f>
nnoremap <buffer> U <c-b>

if !has('nvim')
  " <C-w> works as a prefix in Vim.
  tnoremap <buffer> <C-w> <C-w>.
endif

" As a startpage, not startinsert {{{1
if get(g:, 'loaded_lazy_terminal', 0) | finish | endif
" Note: cannot use ++once to detect &bt in if-sentence
let g:loaded_lazy_terminal = 1

if has('nvim')
  let g:terminal_color_0  = '#2e3436'
  let g:terminal_color_1  = '#e73131'
  let g:terminal_color_2  = '#67c60c'
  let g:terminal_color_3  = '#ddb812'
  let g:terminal_color_4  = '#4383d5'
  let g:terminal_color_5  = '#b859c8'
  let g:terminal_color_6  = '#43c4cc'
  let g:terminal_color_7  = '#d3d7cf'
  let g:terminal_color_8  = '#555753'
  let g:terminal_color_9  = '#fc6868'
  let g:terminal_color_10 = '#8ae234'
  let g:terminal_color_11 = '#fce94f'
  let g:terminal_color_12 = '#729fcf'
  let g:terminal_color_13 = '#ad7fa8'
  let g:terminal_color_14 = '#00f5e9'
  let g:terminal_color_15 = '#eeeeec'
else
  let g:terminal_ansi_colors = [
        \ '#2e3436',
        \ '#e73131',
        \ '#67c60c',
        \ '#ddb812',
        \ '#4383d5',
        \ '#b859c8',
        \ '#43c4cc',
        \ '#d3d7cf',
        \ '#555753',
        \ '#fc6868',
        \ '#8ae234',
        \ '#fce94f',
        \ '#729fcf',
        \ '#ad7fa8',
        \ '#00f5e9',
        \ '#eeeeec',
        \ ]
endif

augroup myTerminalLazy
  au!
  " Open Terminal as Startpage
  "if @% == '' && &ft ==# '' && &bt ==# ''
  "  au VimEnter * nested call termopen(&shell)
  "endif
  exe 'au' TermOpen '* call <SID>set_opts_for_term()'
augroup END

function! s:set_opts_for_term() abort "{{{2
  " Without the check that current buffer is terminal, opening terminal
  " background like with QuickRun apply all the config on non-terminal buffer.
  if &bt !=# 'terminal' | return | endif
  setl nonumber signcolumn= bufhidden=wipe
  norm! 0
  " startinsert " Some plugin start terminal with inserting 'i'.
endfunction

"" Function; ls-grep
"function! s:grep_heavy_bufnr()
"  " TODO: get bufnr('term://') in hidden-buffers to bufdelete them.
"  let l:hidden_buffers = execute('ls!')
"  " e.g., term://foo
"  let l:only_term = substitute(l:hidden_buffers, '[^:\/\/]', '', 'e')
"  let l:only_term_bufnr = substitute(l:)
"  bwipeout g/term:\/\//
"endfunction
