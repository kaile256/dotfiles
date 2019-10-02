" From: external.toml
" Repo: tpope/vim-fugitive

command! -nargs=+ -complete=file Gremote :Git remote <q-args>
" TODO: the substitute() here leaves only /kaile256/foo, i.e., get repo's root.
command! -complete=dir GcreateRepoOnGitHub
      \ :cd %:p:h
      \ <bar> Git remote add origin
      \ 'https://github.com/kaile256/'. s:repo_name .'.git'
command! -complete=dir NNNGcreateRepoOnGitHub
      \ :cd %:p:h
      \ let b:repo_name = substitute(expand('%:p:h:h'), '\v.+kaile256\/(.+)\/.+\/.+', '\1', '')
      \ <bar> Git remote add origin
      \ 'https://github.com/kaile256/'. s:repo_name .'.git'
command! -nargs=+ Gclone :Git clone <q-args>
function! s:fugitive_commit_with_diff() abort "{{1
  call <SID>fugitive__thin_out()
  " Keep to show diff w/ HEAD^ while editting commit-message.
  " TO diff w/ HEAD^ ignores the last commited change to diff.
  Gvdiffsplit! HEAD
  " For: makes user notice if any other changes in the buffer.
  norm gg
  vert bot 35 Gstatus
  setl winfixwidth
  wincmd =
endfunction "}}}
command! Gstage
      \ :Gw | call <SID>fugitive_commit_with_diff()
" in new tab, if any unnecessary windows are there.
" TODO: set unstage
" &@:<C-U>execute <SNR>277_Do('Unstage',0)<CR>
" &@:exe <SNR>277_EchoExec('reset', '-q')<CR>
"command! Gunstage :G
"noremap <silent> <a-y><a-u> :Gunstage<cr>
command! GdiffMode
      \ call <SID>fugitive__thin_out()
      \ | Gvdiffsplit!
function! s:fugitive__thin_out() abort
  let l:current = bufnr('%')
  let l:fdm = &fdm
  " Note: it's almost the same as smart_diffoff()
  windo
        \ if &bt ==# 'nofile'
        \ || &bt ==# 'nowrite'
        \ || &bt ==# 'quickfix'
        \ || bufname('%') =~# 'fugitive:\/\/'
        \ | quit
        \ | endif
  windo
        \ if !&l:diff
        \ | silent wincmd T
        \ | endif
  " TODO: bring me back to the buffer, where this function was called.
  "exe l:current .'tabnext'
  exe 'setl foldmethod='. l:fdm
endfunction

" Info; Blame {{{
nnoremap <silent> <a-y>b     :<c-u>Gblame<cr>
nnoremap <silent> <a-y><a-b> :<c-u>Gblame<cr>
"}}}
" Info; Status {{{
nnoremap <silent> <a-y>s     :<c-u>vert bot 40 Gstatus<cr>
nnoremap <silent> <a-y><a-s> :<c-u>vert bot 40 Gstatus<cr>
"}}}
" Add; Only {{{
nnoremap <silent> <a-y>a     :Gw <bar> Gstatus<cr>
nnoremap <silent> <a-y><a-a> :Gw <bar> Gstatus<cr>
"}}}
" Add; && Commit w/ diff {{{1
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
  au FileType fugitive,fugitiveblame,gitcommit setl nonumber signcolumn=
  au FileType gitcommit setl spell
  au FileType fugitive nunmap <buffer> dq
  au FileType fugitive nnoremap <silent><buffer> dq :call <SID>fugitive__thin_out()<cr>``
  " For: especially in the case, ':norm U' to unstage all.
  nnoremap <silent> <Plug>(fugitive-gstage-last-window) :<c-u>wincmd p <cr> :Gw <bar> wincmd p<cr>
  au FileType fugitive nmap <silent><buffer> S <Plug>(fugitive-gstage-last-window)
  "au BufWinLeave gitcommit Gcommit | norm <c-w>h:diffoff!<cr>
  " TODO: Go back to Gstatus' buffer when `:quit` on gitcommit's buffer
  "au BufLeave .git/COMMIT_EDITMSG exe setpos(., bufnr('.git/index'), 1, 1, 1)
augroup END
