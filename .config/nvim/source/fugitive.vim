" From: git.toml
" Repo: tpope/vim-fugitive
" Another: add/fugitive.vim

augroup FugitiveCallMyFunc
  au!
  function! s:restore_view() abort "{{{1
    call win_gotoid(t:my_fugitive_save_winid)
    " back to a buffer of status if there
    call win_gotoid(bufwinid('.git/index'))
  endfunction

  au FileType fugitive  call s:fugitive_keymap() "{{{1
  function! s:fugitive_keymap() abort "{{{0
    " TODO: Specify the window of the latest commit buffer on `dq`.
    nnoremap <buffer><silent> cc :<C-U>bot 20 Gcommit<CR>
    nnoremap <buffer><silent> ca :<C-U>bot 20 Gcommit --amend<CR>
    " To: continue to cc/ce/ca.
    xmap <buffer> c sc
    " Note: for fugitive-buffer, not for &diff
    "nnoremap <silent><buffer><nowait> dq :<c-u>WindowPKreduce<cr>
    "xnoremap <silent><buffer><nowait> dq :<c-u>WindowPKreduce<cr>
    silent! nunmap <buffer> J
    silent! nunmap <buffer> K
    " For: especially in the case, ':norm U' to unstage all.
    nmap <buffer> S <Plug>(fugitive:gstage-prev-window)
    nmap <buffer> D <Plug>(fugitive:diff-to-HEAD)
  endfunction
  nnoremap <silent> <Plug>(fugitive:gstage-prev-window) :<c-u>wincmd p <bar> :Gw <bar> wincmd p <bar>call feedkeys('gszz')<cr>
  nnoremap <silent> <Plug>(fugitive:diff-to-HEAD) :<c-u>wincmd p <bar> :Gw <bar> :GwinpickVDiff HEAD <bar> Gvstatus<cr>

  au FileType gitcommit call s:gitcommit_startinsert() "{{{1
  function! s:gitcommit_startinsert()
    if getline(1, search('# Please enter the commit message', 'n') - 1) ==# ['']
      startinsert
    endif
  endfunction
  au FileType gitcommit call s:gitcommit_keymap() "{{{1
  function! s:gitcommit_keymap() abort
    nmap <buffer> ZQ         <Plug>(gitcommit-discard)
    nmap <buffer> Zq         <Plug>(gitcommit-discard)
    nmap <buffer> <c-w>c     <Plug>(gitcommit-discard)
    nmap <buffer> <c-w><c-c> <Plug>(gitcommit-discard)
    nmap <buffer><nowait> dq <Plug>(gitcommit-dismiss)

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
  nnoremap <silent> <Plug>(gitcommit-discard) :<c-u>call <SID>gitcommit_discard()<cr>
  function! s:gitcommit_discard() abort
    call s:gitcommit_shred()
    quit
    call s:restore_view()
  endfunction

  " nmap dismiss {{{3
  nnoremap <silent> <Plug>(gitcommit-dismiss) :<c-u>call <SID>gitcommit_dismiss()<cr>
  function! s:gitcommit_dismiss() abort
    call s:gitcommit_shred()
    WinReduce
    call s:restore_view()
  endfunction

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
  au FileType gitcommit setl spell
augroup END
