" From: external.toml
" Repo: tpope/vim-fugitive

command! -nargs=+ -complete=file Gremote :Git remote <q-args>
" TODO: the substitute() here leaves only /kaile256/foo, i.e., get repo's root.

" Note: no use yet.
command! -nargs=+ -complete=dir HubCreate
      \ !hub create <args>

command! -nargs=+ Gclone :Git clone <q-args>
"command! Glogmode :tabe | Glog

function! fugitive#commit_with_diff() abort "{{1
  call window#extract()
  " Keep to show diff w/ HEAD while editting commit-message.
  Gvdiffsplit! HEAD
  " For: makes user notice if any other changes in the buffer.
  norm gg
  vert bot 35 Gstatus
  setl winfixwidth
  wincmd =
endfunction "}}}
command! Gstage
      \ :Gw | call fugitive#commit_with_diff()
" in new tab, if any unnecessary windows are there.
" TODO: set unstage
" &@:<C-U>execute <SNR>277_Do('Unstage',0)<CR>
" &@:exe <SNR>277_EchoExec('reset', '-q')<CR>
"command! Gunstage :G
"noremap <silent> <space>g<a-u> :Gunstage<cr>
command! GdiffMode
      \ call window#extract()
      \ | Gvdiffsplit!

" Info; Blame {{{
nnoremap <silent> <space>gb     :<c-u>Gblame<cr>
"}}}
" Info; Status {{{
nnoremap <silent> <space>gs     :<c-u>vert bot 35 Gstatus<cr>
"}}}
" Add; Only {{{
nnoremap <silent> <space>ga     :<c-u>Gw <bar> bot 35 Gstatus<cr>
"}}}
" Add; && Commit w/ diff {{{1
nnoremap <silent> <space>gw     :<c-u>Gstage<cr>
"}}}
" Diff; {{{
" !: On a Merge Conflict, do a 3-diff; otherwise the same as without bang.
nnoremap <silent> <space>gd     :<c-u>GdiffMode<cr>
"}}}

function! s:on_gitcommit_startinsert() "{{{1
  if getline(1) ==# ''
    if getline(2) ==# '# Please enter the commit message for your changes. Lines starting'
      startinsert
    endif
  endif
endfunction "}}}

function! s:keymap_fugitive()
  " TODO: Specify the window of the latest commit buffer on `dq`.
  nnoremap <buffer><silent> cc    :<C-U>bot 20 Gcommit<CR>
  nnoremap <buffer><silent> ca    :<C-U>bot 20 Gcommit --amend<CR>
  " Continue to cc/ce/ca.
  xmap <buffer> c sc
  nunmap <buffer> dq
  " For: especially in the case, ':norm U' to unstage all.
  nnoremap <silent> <Plug>(fugitive:gstage-prev-window) :<c-u>wincmd p <cr> :Gw <bar> wincmd p<cr>
  nmap <buffer> S <Plug>(fugitive:gstage-prev-window)
endfunction

function! s:keymap_gitlog() abort
  nnoremap <buffer><silent> <c-o> :cnext<cr>
  nnoremap <buffer><silent> <c-i> :cprev<cr>
endfunction
augroup FugitiveCallMyFunc "{{{1
  au!
  au FileType fugitive  call <SID>keymap_fugitive()
  au FileType gitcommit call <SID>on_gitcommit_startinsert()
  au FIleType git call <SID>keymap_gitlog()
augroup END "}}}
augroup OnFugitiveBuffer
  au!
  " TODO: Go back to Gstatus' buffer when `:quit` on gitcommit's buffer
  au FileType fugitive,fugitiveblame,gitcommit setl nonumber signcolumn=
  au FileType gitcommit setl spell
  " Dispose commit-message.
  au FileType gitcommit nnoremap <buffer> dq ggdGZZ:call window#weed_out()<cr>
augroup END
