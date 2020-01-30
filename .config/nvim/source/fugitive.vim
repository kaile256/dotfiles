" From: git.toml
" Repo: tpope/vim-fugitive
" Another: add/fugitive.vim

augroup FugitiveCallMyFunc
  au!
  function! s:gitcommit(...) abort "{{{1
    let winnr = bufwinnr('.git/COMMIT_EDITMSG')
    if winnr != -1
      echo 'gitcommit-buffer updating...'
      exe winnr 'windo GcommitDiscard'
    endif

    let args = a:0 > 0 ? join(a:000) : ''
    exe 'bot 20 Gcommit' args
  endfunction

  au FileType fugitive call s:fugitive_keymap() "{{{1
  function! s:fugitive_keymap() abort "{{{2
    " Note: for fugitive-buffer, not for &diff
    silent! nunmap <buffer> J
    silent! nunmap <buffer> K

    " especially for the case ':norm U' to unstage all
    nnoremap <buffer><silent> <Plug>(fugitive:gstage-prev-window)
          \ :<c-u>wincmd p <bar> Gw <bar> wincmd p <bar>
          \ call feedkeys('gszz')<cr>
    nmap <buffer> S <Plug>(fugitive:gstage-prev-window)

    nnoremap <buffer><silent> <Plug>(fugitive:diff-to-HEAD)
          \ :<c-u>wincmd p <bar> Gw <bar> GwToDiff HEAD <bar> Gvstatus<cr>
    nmap <buffer> D <Plug>(fugitive:diff-to-HEAD)

    command! -bang -nargs=? -range=-1 -addr=tabs -buffer
          \ -complete=customlist,fugitive#CommitComplete
          \ GcommitBottom
          \ :call s:gitcommit(<q-args>)

    " TODO: Specify the window of the latest commit buffer on `dq`.
    "nnoremap <buffer><silent> cc :<C-U>bot 20 Gcommit<CR>
    "nnoremap <buffer><silent> ca :<C-U>bot 20 Gcommit --amend<CR>
    nnoremap <buffer><silent> cc :<c-u>GcommitBottom<cr>
    nnoremap <buffer><silent> ca :<c-u>GcommitBottom --amend<cr>
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
    nnoremap <silent> <Plug>(gitcommit-discard) :<c-u>GcommitDiscard<cr>
    nmap <buffer> ZQ         <Plug>(gitcommit-discard)
    nmap <buffer> Zq         <Plug>(gitcommit-discard)
    nmap <buffer> <c-w>c     <Plug>(gitcommit-discard)
    nmap <buffer> <c-w><c-c> <Plug>(gitcommit-discard)
    nmap <buffer><nowait> dQ <Plug>(fugitive-dismiss)

    nmap <c-w>o     <Plug>(winonly-careful)
    nmap <c-w><c-o> <Plug>(winonly-careful)

    " TODO: make <SID>sendkey() work!
    " CAUTION: <c-u> is very useful
    "inoremap <buffer><nowait> <c-f> <esc>:call <SID>sendkey("\<c-f>")<cr>a
    "inoremap <buffer><nowait> <c-b> <esc>:call <SID>sendkey("\<c-b>")<cr>a
    "inoremap <buffer><nowait> <c-q> <esc>:call <SID>sendkey(getchar())<cr>a
  endfunction

  nnoremap <silent> <Plug>(winonly-careful) :<c-u>call <SID>winonly_careful()<cr>
  function! s:winonly_careful() abort
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
  nnoremap <silent> <Plug>(fugitive-dismiss) :<c-u>call <SID>fugitive_dismiss()<cr>
  "nmap dQ <Plug>(fugitive-dismiss)

  "au FIleType git call s:gitlog_keymaps() "{{{1
  "function! s:gitlog_keymaps() abort
  "  nnoremap <buffer><silent> <c-o> :cnext<cr>
  "  nnoremap <buffer><silent> <c-i> :cprev<cr>
  "endfunction

  "}}}1
augroup END

augroup OnFugitiveBuffer
  au!
  " TODO: Go back to Gstatus' buffer when `:quit` on gitcommit's buffer
  au FileType fugitive,fugitiveblame,gitcommit setl nonumber signcolumn= bufhidden=wipe
  au FileType gitcommit setl spell spl=en_us,cjk
augroup END
