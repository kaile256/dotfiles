" From: git.toml
" Repo: tpope/vim-fugitive
" Another: add/fugitive.vim

augroup FugitiveCallMyFunc
  au!
  function! s:winonly() abort "{{{
    if index(tabpagebuflist(), bufnr('COMMIT_EDITMSG')) != -1
      exe bufnr('COMMIT_EDITMSG') .'windo call s:gitcommit_discard()'
    endif
    only
    call s:restore_view()
  endfunction "}}}

  function! s:fugitive_keymap() "{{{
    " TODO: Specify the window of the latest commit buffer on `dq`.
    nnoremap <buffer><silent> cc    :<C-U>bot 20 Gcommit<CR>
    nnoremap <buffer><silent> ca    :<C-U>bot 20 Gcommit --amend<CR>
    " To: continue to cc/ce/ca.
    xmap <buffer> c sc
    " Note: for fugitive-buffer, not for &diff
    "nnoremap <silent><buffer><nowait> dq :<c-u>WindowPKreduce<cr>
    "xnoremap <silent><buffer><nowait> dq :<c-u>WindowPKreduce<cr>
    silent! nunmap <buffer> J
    silent! nunmap <buffer> K
    " For: especially in the case, ':norm U' to unstage all.
    nmap     <buffer> S <Plug>(fugitive:gstage-prev-window)
  endfunction "}}}
  nnoremap <silent> <Plug>(fugitive:gstage-prev-window) :<c-u>wincmd p <bar> :Gw <bar> wincmd p<cr>
  au FileType fugitive  call s:fugitive_keymap()

  function! s:gitcommit_startinsert() "{{{
    if getline(1) ==# ''
      if getline(2) ==# '# Please enter the commit message for your changes. Lines starting'
        startinsert
      endif
    endif
  endfunction "}}}
  au FileType gitcommit call s:gitcommit_startinsert()

  function! s:gitcommit_shred() abort "{{{
    silent %delete _
    write
  endfunction "}}}

  function! s:restore_view() abort "{{{
    call windowPK#view#restore()
    call win_gotoid(bufwinid('.git/index'))
  endfunction "}}}

  function! s:gitcommit_discard() abort "{{{
    call s:gitcommit_shred()
    quit
    call s:restore_view()
  endfunction "}}}

  function! s:gitcommit_dismiss() abort "{{{
    call s:gitcommit_shred()
    WindowPKreduce
    call s:restore_view()
  endfunction "}}}

  nnoremap <silent> <Plug>(gitcommit-discard) :<c-u>call <SID>gitcommit_discard()<cr>
  nnoremap <silent> <Plug>(gitcommit-dismiss) :<c-u>call <SID>gitcommit_dismiss()<cr>

  function! s:gitcommit_keymap() abort "{{{
    nmap <buffer> ZQ         <Plug>(gitcommit-discard)
    nmap <buffer> Zq         <Plug>(gitcommit-discard)
    nmap <buffer> <c-w>c     <Plug>(gitcommit-discard)
    nmap <buffer> <c-w><c-c> <Plug>(gitcommit-discard)
    nmap <buffer><nowait> dq <Plug>(gitcommit-dismiss)
    "omap <expr><buffer><nowait> q (v:operator ==# 'd')? '<Plug>(gitcommit-dismiss)': 'q'
    " TODO: in case <c-w>o out of the buffer
  endfunction "}}}
  au FileType gitcommit call s:gitcommit_keymap()
  "function! s:keymap_gitlog() abort "{{{
  "  nnoremap <buffer><silent> <c-o> :cnext<cr>
  "  nnoremap <buffer><silent> <c-i> :cprev<cr>
  "endfunction "}}}
  "au FIleType git       call s:keymap_gitlog()
augroup END

augroup OnFugitiveBuffer
  au!
  " TODO: Go back to Gstatus' buffer when `:quit` on gitcommit's buffer
  au FileType fugitive,fugitiveblame,gitcommit setl nonumber signcolumn= bufhidden=wipe
  au FileType gitcommit setl spell
augroup END
