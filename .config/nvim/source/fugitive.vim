" From: git.toml
" Repo: tpope/vim-fugitive
" Another: add/fugitive.vim

augroup FugitiveCallMyFunc
  au!
  function! s:restore_view() abort "{{{1
    call win_gotoid(t:my_fugitive_save_winid)
    call win_gotoid(bufwinid('.git/index'))
  endfunction

  au FileType fugitive  call s:fugitive_keymap() "{{{1
  function! s:fugitive_keymap() abort "{{{0
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
    nmap <buffer> S <Plug>(fugitive:gstage-prev-window)
    nmap <buffer> D <Plug>(fugitive:diff-to-HEAD)
  endfunction
  nnoremap <silent> <Plug>(fugitive:gstage-prev-window) :<c-u>wincmd p <bar> :Gw <bar> wincmd p<cr>
  nnoremap <silent> <Plug>(fugitive:diff-to-HEAD) :<c-u>wincmd p <bar> :Gw <bar> :GwinpickVDiff HEAD <bar> Gvstatus<cr>


  au FileType gitcommit call s:gitcommit_startinsert() "{{{1
  function! s:gitcommit_startinsert()
    if getline(1, search('# Please enter the commit message') - 1) ==# []
        startinsert
    endif
  endfunction
  au FileType gitcommit call s:gitcommit_keymap() "{{{1
  nnoremap <silent> <Plug>(gitcommit-discard) :<c-u>call <SID>gitcommit_discard()<cr>
  nnoremap <silent> <Plug>(gitcommit-dismiss) :<c-u>call <SID>gitcommit_dismiss()<cr>
  function! s:gitcommit_keymap() abort
    nmap <buffer> ZQ         <Plug>(gitcommit-discard)
    nmap <buffer> Zq         <Plug>(gitcommit-discard)
    nmap <buffer> <c-w>c     <Plug>(gitcommit-discard)
    nmap <buffer> <c-w><c-c> <Plug>(gitcommit-discard)
    nmap <buffer><nowait> dq <Plug>(gitcommit-dismiss)
    "omap <expr><buffer><nowait> q (v:operator ==# 'd')? '<Plug>(gitcommit-dismiss)': 'q'
    " TODO: in case <c-w>o out of the buffer
  endfunction

  function! s:gitcommit_shred() abort "{{{2
    silent %delete _
    write
  endfunction

  function! s:gitcommit_discard() abort "{{{2
    call s:gitcommit_shred()
    quit
    call s:restore_view()
  endfunction

  function! s:gitcommit_dismiss() abort "{{{2
    call s:gitcommit_shred()
    WinReduce
    call s:restore_view()
  endfunction

  "au FIleType git       call s:gitlog_keymaps() "{{{1
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
