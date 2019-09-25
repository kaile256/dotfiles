" From: external.toml
" Repo: tpope/vim-fugitive

command! -nargs=+ Gclone :Git clone <q-args>
function! s:fugitive_commit_with_diff() abort "{{1
  silent wincmd T
  " Keep to show diff w/ HEAD^ while editting commit-message.
  " TO diff w/ HEAD^ ignores the last commited change to diff.
  Gvdiffsplit! HEAD
  norm <c-o>
  vert bot 35 Gstatus
  setl winfixwidth
  wincmd =
endfunction "}}}
command! Gstage :Gw <bar> call <SID>fugitive_commit_with_diff()
" in new tab, if any unnecessary windows are there.
command! GdiffMode :cclose <bar> silent wincmd T <bar> Gvdiffsplit!

" Info; Blame {{{
nnoremap <silent> <a-y>b     :<c-u>Gblame<cr>
nnoremap <silent> <a-y><a-b> :<c-u>Gblame<cr>
"}}}
" Info; Status {{{
nnoremap <silent> <a-y>s     :<c-u>vert bot 40 Gstatus<cr>
nnoremap <silent> <a-y><a-s> :<c-u>vert bot 40 Gstatus<cr>
nnoremap <silent> S :<c-u>wincmd p <bar> Gadd <bar> wincmd p<cr>
"}}}
" Add; Only {{{
nnoremap <silent> <a-y>a     :<c-u>Gw<cr>
nnoremap <silent> <a-y><a-a> :<c-u>Gw<cr>
"}}}
" Add; && Commit w/ diff {{{1
"noremap <silent> <a-y>w     :<c-u>cclose <bar> Gw <cr> :call <SID>fugitive_commit_with_diff()<cr>
"noremap <silent> <a-y><a-w> :<c-u>cclose <bar> Gw <cr> :call <SID>fugitive_commit_with_diff()<cr>
nnoremap <silent> <a-y>w     :<c-u>cclose <bar> :Gstage<cr>
nnoremap <silent> <a-y><a-w> :<c-u>cclose <bar> :Gstage<cr>
"}}}
" Diff; {{{
" !: On a Merge Conflict, do a 3-diff; otherwise the same as without bang.
nnoremap <silent> <a-y>d     :<c-u>GdiffMode<cr>
nnoremap <silent> <a-y><a-d> :<c-u>GdiffMode<cr>
"}}}

function! s:on_gitcommit_startinsert() "{{{1
  if getline(1) ==# ''
    if getline(2) ==# '# Please enter the commit message for your changes. Lines starting'
      startinsert
    endif
  endif
endfunction "}}}

function! s:on_fugitive_keymap()
  " TODO: Specify the window of the latest commit buffer on `dq`.
  nnoremap <buffer><silent> dq    <c-w>h<c-w>o:diffoff!<cr>
  nnoremap <buffer><silent> cc    :<C-U>bot 20 Gcommit<CR>
  nnoremap <buffer><silent> ca    :<C-U>bot 20 Gcommit --amend<CR>
  " Continue to cc/ce/ca.
  xmap <buffer> c sc
endfunction

augroup FugitiveCallMyFunc "{{{1
  au!
  au FileType fugitive  call <SID>on_fugitive_keymap()
  au FileType gitcommit call <SID>on_gitcommit_startinsert()
augroup END "}}}
augroup OnFugitiveBuffer
  au!
  " gitcommit should be writeable not setting bt=qf.
  au FileType fugitive,fugitiveblame setl nonumber signcolumn= bt=quickfix
  au FileType gitcommit              setl spell    nonumber    signcolumn=
  "au BufWinLeave gitcommit Gcommit | norm <c-w>h:diffoff!<cr>
  " TODO: Go back to Gstatus' buffer when `:quit` on gitcommit's buffer
  "au BufLeave .git/COMMIT_EDITMSG exe setpos(., bufnr('.git/index'), 1, 1, 1)
augroup END
