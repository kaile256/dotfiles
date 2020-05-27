" From: git.toml
" Repo: tpope/vim-fugitive
" Another: add/fugitive.vim

augroup myFugitiveSource
  if exists('#myFugitiveSource') | au! myFugitiveSource
  endif
  au FileType fugitive call s:fugitive_keymap() "{{{1
  function! s:fugitive_keymap() abort "{{{2
    " Note: for fugitive-buffer, not for &diff
    silent! unmap <buffer> J
    silent! unmap <buffer> K

    " especially for the case ':norm U' to unstage all
    nnoremap <buffer><silent> <SID>(fugitive:gstage-prev-window)
          \ :<c-u>wincmd p <bar> Gw <bar> wincmd p <bar>
          \ call feedkeys('gszz')<cr>
    nnoremap <script><buffer> S <SID>(fugitive:gstage-prev-window)

    nnoremap <buffer><silent> <SID>(fugitive:diff-to-HEAD)
          \ :<c-u>wincmd p <bar> Gw <bar> GwToDiff HEAD <bar> Gvstatus<cr>
    nnoremap <script><buffer> D <SID>(fugitive:diff-to-HEAD)

    nnoremap <buffer><silent> cc :<c-u>bot 20 Gcommit<cr>
    nnoremap <buffer><silent> ca :<c-u>bot 20 Gcommit --amend<cr>
    " To: continue to cc/ce/ca.
    xnoremap <buffer> c sc
  endfunction

  au FileType gitcommit call s:gitcommit_startinsert() "{{{1
  function! s:gitcommit_startinsert()
    if getline(1, search('# Please enter the commit message', 'n') - 1) ==# ['']
      startinsert
    endif
  endfunction
  au FileType gitcommit call s:gitcommit_keymap() "{{{1
  function! s:gitcommit_keymap() abort
    command! -buffer GcommitDiscard :call s:gitcommit_discard()
    nnoremap <silent> <SID>(gitcommit-discard) :<c-u>GcommitDiscard<cr>
    nnoremap <script><buffer> ZQ         <SID>(gitcommit-discard)
    nnoremap <script><buffer> Zq         <SID>(gitcommit-discard)
    nnoremap <script><buffer> <c-w>c     <SID>(gitcommit-discard)
    nnoremap <script><buffer> <c-w><c-c> <SID>(gitcommit-discard)
    nnoremap <script><buffer><nowait> dQ <SID>(fugitive-dismiss)

    nnoremap <script> <c-w>o     <SID>(winonly-careful)
    nnoremap <script> <c-w><c-o> <SID>(winonly-careful)

    " TODO: make <SID>sendkey() work!
    " CAUTION: <c-u> is very useful
    "inoremap <buffer><nowait> <c-f> <esc>:call <SID>sendkey("\<c-f>")<cr>a
    "inoremap <buffer><nowait> <c-b> <esc>:call <SID>sendkey("\<c-b>")<cr>a
    "inoremap <buffer><nowait> <c-q> <esc>:call <SID>sendkey(getchar())<cr>a
  endfunction

  nnoremap <silent> <SID>(winonly-careful) :<c-u>call <SID>winonly_careful()<cr>
  function! s:winonly_careful() abort
    wincmd H
    call s:gitcommit_shred()
    only
    diffoff!
  endfunction

  function! s:sendkey(key) abort "{{{2
    call win_gotoid(t:my_fugitive_save_winid)
    exe 'norm!' a:key
    wincmd p
  endfunction

  " gitcommit mappings & functions {{{2
  function! s:gitcommit_shred() abort
    " FIXME: keep the window that cursor was previously in
    let winID      = bufwinid('%')
    let commit_win = bufwinid('COMMIT_EDITMSG')
    if commit_win > 0
      call win_gotoid(commit_win)
      silent %delete _
      write
    endif
    call win_gotoid(winID)
  endfunction

  " nmap discard {{{3
  function! s:gitcommit_discard() abort
    call s:gitcommit_shred()
    quit
  endfunction

  " nmap dismiss {{{3
  function! s:fugitive_dismiss() abort
    call s:gitcommit_shred()
    WinReduce
    "call win_gotoid(bufwinid('.git/index'))
  endfunction
  nnoremap <silent> <SID>(fugitive-dismiss) :<c-u>call <SID>fugitive_dismiss()<cr>
  "nmap dQ <SID>(fugitive-dismiss)

  "au FIleType git call s:gitlog_keymaps() "{{{1
  "function! s:gitlog_keymaps() abort
  "  nnoremap <buffer><silent> <c-o> :cnext<cr>
  "  nnoremap <buffer><silent> <c-i> :cprev<cr>
  "endfunction

  "}}}1
  " on Fugitive Buffer {{{1
  " TODO: Go back to Gstatus' buffer when `:quit` on gitcommit's buffer
  au FileType fugitive,fugitiveblame setl nonumber signcolumn= bufhidden=wipe
  au FileType git setl fdl=99
  au BufRead fugitive:///* setl buftype=nofile
augroup END
