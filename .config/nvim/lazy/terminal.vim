" From: init.vim
" Another: tmaps.vim
" Another: keymap/open_terminal.vim

if &bt !=# 'terminal' | finish | endif

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

nnoremap <buffer><nowait> d <c-d>
nnoremap <buffer><nowait> u <c-u>

nnoremap <buffer> D <c-f>
nnoremap <buffer> U <c-b>

if !has('nvim')
  " <C-w> works as a prefix in Vim.
  tnoremap <buffer> <C-w> <C-w>.
endif

augroup myTerminalLazy
  au!
  " Open Terminal as Startpage
  "if @% == '' && &ft ==# '' && &bt ==# ''
  "  au VimEnter * nested call termopen(&shell)
  "endif
  exe 'au' TermOpen '* call <SID>set_opts_for_term()'
  if !has('nvim')
    function! s:termopen_via_path() abort
      " Inspired by https://qiita.com/gorilla0513/items/0b0a30a6d5006515ae4d
      let cmd = matchstr(bufname(), 'term:\/\/\zs.*')
      exe 'term ++curwin ++close ++shell'
            \ (len(cmd) == 0 ? $SHELL : cmd)
    endfunction
    au BufReadCmd term://* call s:termopen_via_path()
  endif
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
