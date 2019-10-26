" From: git.toml
" Repo: tpope/vim-fugitive

command! -nargs=+ -complete=file Gremote :Git remote <q-args>

command! -nargs=+ Gclone :Git clone <q-args>

" Dependent commands {{{1
" Note: no use yet.
"command! -nargs=* -complete=dir HubCreate call <SID>hub_create(<f-args>)
function! s:hub_create(path, ...) abort
  " TODO: distinguish flag and path
  if a:path ==# '.'
    FindRoot
    let l:dir_path = execute('pwd')
  elseif system('-f a:path:p')
    let l:dir_path = a:path:p:h
  endif
  !hub create a:000 l:dir_path
endfunction

function! fugitive#commit_with_diff() abort "{{2
  call panesFM#harvest()
  " Keep to show diff w/ HEAD while editting commit-message.
  Gvdiffsplit! HEAD
  " For: makes user notice if any other changes in the buffer.
  norm gg
  vert bot 35 Gstatus
  setl winfixwidth
  wincmd =
endfunction "}}}2
command! Gstage
      \ :Gw | call fugitive#commit_with_diff()
" in new tab, if any unnecessary windows are there.
" TODO: set unstage; should trace <SNR> via :scriptnames.
" &@:<C-U>execute <SNR>277_Do('Unstage',0)<CR>
" &@:exe <SNR>277_EchoExec('reset', '-q')<CR>
"command! Gunstage :execute <SNR>219_Do('Unstage',0)
"noremap <silent> <space>g<a-u> :Gunstage<cr>
command! -bar -bang -nargs=* -complete=customlist,fugitive#EditComplete GvdiffMode
      \ call panesFM#harvest()
      \ | Gvdiffsplit! <args>
"}}}1

" Info; Blame {{{
nnoremap <silent> <space>gb     :<c-u>Gblame<cr>
"}}}
" Info; Status {{{
nnoremap <silent> <space>gs     :<c-u>vert bot 35 Gstatus<cr>
"}}}
" Add; Only {{{
nnoremap <silent> <space>ga     :<c-u>Gw <bar> vert bot 35 Gstatus<cr>
"}}}
" Add; && Commit w/ diff {{{1
nnoremap <silent> <space>gw     :<c-u>Gstage<cr>
"}}}
" Diff; {{{
" !: On a Merge Conflict, do a 3-diff; otherwise the same as without bang.
nnoremap <silent> <space>gd     :<c-u>GvdiffMode<cr>
"}}}

function! s:gitcommit_startinsert() "{{{1
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
  " TODO: silent! on unmap <buffer> from the source of vim-fugitives.
  "windo silent! nunmap <buffer> dq
  silent! nunmap <buffer> dq
  silent! nunmap <buffer> J
  silent! nunmap <buffer> K
  " For: especially in the case, ':norm U' to unstage all.
  nnoremap <silent> <Plug>(fugitive:gstage-prev-window) :<c-u>wincmd p <cr> :Gw <bar> wincmd p<cr>
  nmap     <buffer> S <Plug>(fugitive:gstage-prev-window)
endfunction

augroup FugitiveCallMyFunc "{{{1
  au!
  au FileType fugitive  call <SID>keymap_fugitive()
  au FileType gitcommit call <SID>gitcommit_startinsert()
  function! s:keymap_gitlog() abort "{{{
    nnoremap <buffer><silent> <c-o> :cnext<cr>
    nnoremap <buffer><silent> <c-i> :cprev<cr>
  endfunction "}}}
  "au FIleType git       call <SID>keymap_gitlog()
augroup END "}}}
augroup OnFugitiveBuffer
  au!
  " TODO: Go back to Gstatus' buffer when `:quit` on gitcommit's buffer
  au FileType fugitive,fugitiveblame,gitcommit setl nonumber signcolumn= bufhidden=wipe
  au FileType gitcommit setl spell
  " Dispose commit-message.
  function! s:discard_gitcommit() abort
    v/^#/norm! d _
    WinWeedout
  endfunction
  nnoremap <Plug>(discard-gitcommit) call <SID>discard_gitcommit()
  au FileType gitcommit nmap <buffer> dq <Plug>(discard-gitcommit)
augroup END
