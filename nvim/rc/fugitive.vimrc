" From: external.toml
" Repo: fugitive.vim

"" Info; Log {{{
"noremap <silent> <a-y>l     :<c-u>tab sp <bar> Glog <bar> copen<cr>
"noremap <silent> <a-y><a-l> :<c-u>tab sp <bar> Glog <bar> copen<cr>
"
"noremap <silent> <a-y>c     :<c-u>tab sp <bar> Glog -- <cr>
"noremap <silent> <a-y><a-c> :<c-u>tab sp <bar> Glog -- <cr>
"
"noremap <silent> <a-y>m     :<c-u>tab sp <bar> Glog master..HEAD --<cr>
"noremap <silent> <a-y><a-m> :<c-u>tab sp <bar> Glog master..HEAD --<cr>
""}}}
" Info; Blame {{{
noremap <silent> <a-y>b     :<c-u>Gblame<cr>
noremap <silent> <a-y><a-b> :<c-u>Gblame<cr>
"}}}
" Info; Status {{{
noremap <silent> <a-y>s     :<c-u>vert bot 40 Gstatus<cr>
noremap <silent> <a-y><a-s> :<c-u>vert bot 40 Gstatus<cr>
"}}}

" Diff; {{{
" !: On a Merge Conflict, do a 3-diff; otherwise the same as without bang.
noremap <silent> <a-y>d     :<c-u>cclose<cr><c-w>T:<c-u>Gvdiffsplit!<cr>
noremap <silent> <a-y><a-d> :<c-u>cclose<cr><c-w>T:<c-u>Gvdiffsplit!<cr>
"}}}

" Add; Only {{{
noremap <silent> <a-y>a     :<c-u>Gw<cr>
noremap <silent> <a-y><a-a> :<c-u>Gw<cr>
"}}}
" Add; && Commit w/ diff {{{
function! s:fugitive_commit_with_diff() abort
  norm T
  " Keep to show diff w/ HEAD^ while editting commit-message.
  Gvdiffsplit! HEAD^
  vert bot Gstatus
  norm =
  vert resize 50
endfunction
"noremap <silent> <a-y>w     :<c-u>cclose <bar> Gw <cr> <c-w>T :Gvdiffsplit ^HEAD <bar> vert bot Gstatus<cr> <c-w>= :vert resize 50<cr>
"noremap <silent> <a-y><a-w> :<c-u>cclose <bar> Gw <cr> <c-w>T :Gvdiffsplit ^HEAD <bar> vert bot Gstatus<cr> <c-w>= :vert resize 50<cr>
noremap <silent> <a-y>w     :<c-u>cclose <bar> Gw <cr> :call <SID>fugitive_commit_with_diff()<cr>
noremap <silent> <a-y><a-w> :<c-u>cclose <bar> Gw <cr> :call <SID>fugitive_commit_with_diff()<cr>
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
endfunction

augroup FugitiveCallMyFunc "{{{1
  au!
  au FileType fugitive call <SID>on_fugitive_keymap()
  au FileType gitcommit call <SID>on_gitcommit_startinsert()
augroup END "}}}
augroup OnFugitiveBuffer
  au!
  " gitcommit should be writeable not setting bt=qf.
  au FileType fugitive,fugitiveblame setl nonumber signcolumn= bt=quickfix
  au FileType gitcommit              setl spell    nonumber    signcolumn=
  " TODO: Go back to Gstatus' buffer when `:quit` on gitcommit's buffer
  "au BufLeave .git/COMMIT_EDITMSG exe setpos(., bufnr('.git/index'), 1, 1, 1)
augroup END
