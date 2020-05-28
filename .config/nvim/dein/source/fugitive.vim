" From: git.toml
" Repo: tpope/vim-fugitive
" Another: add/fugitive.vim

augroup myFugitiveRememberTheLastBuffer
  if exists('#myFugitiveRememberTheLastBuffer')
    au! myFugitiveRememberTheLastBuffer
  endif
  au FileType fugitive,gitcommit
        \ if getwinvar(winnr('#'), '&ft') !~# 'fugitive\|gitcommit'
        \ | let s:save_winid = win_getid(winnr('#')) | endif
  au BufWinLeave .git/{index,COMMIT_EDITMSG} call win_gotoid(s:save_winid)
augroup END

augroup myFugitiveSo
  if exists('#myFugitiveSo') | au! myFugitiveSo
  endif
  au FileType fugitive  call s:fugitive_keymap()
  au FileType gitcommit call s:gitcommit_keymap()
  au FileType gitcommit call s:gitcommit_startinsert()

  au FileType git setl fdl=99
  au FileType fugitive,fugitiveblame setl nonumber signcolumn= bufhidden=wipe
  au BufRead fugitive:///* setl buftype=nofile
augroup END

" Define Functions for autocmds {{{1
function! s:gitcommit_startinsert() "{{{2
  if getline(1, search('# Please enter the commit message', 'n') - 1) ==# ['']
    startinsert
  endif
endfunction

" Define Keymaps on Buffer {{{2
function! s:fugitive_keymap() abort "{{{3
  " Note: for fugitive-buffer, not for &diff
  silent! unmap j
  silent! unmap k
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
  nnoremap <buffer> R :<C-u>call <SID>git_reset()<CR>
endfunction

function! s:gitcommit_keymap() abort "{{{3
  command! -buffer GcommitDiscard :call s:gitcommit_discard()
  nnoremap <silent> <SID>(gitcommit-discard) :<c-u>GcommitDiscard<cr>
  nnoremap <silent> <SID>(winonly-careful) :<c-u>call <SID>winonly_careful()<cr>
  nnoremap <silent> <SID>(fugitive-dismiss) :<c-u>call <SID>fugitive_dismiss()<cr>
  nnoremap <script><buffer> ZQ         <SID>(gitcommit-discard)
  nnoremap <script><buffer> Zq         <SID>(gitcommit-discard)
  nnoremap <script><buffer> <c-w>c     <SID>(gitcommit-discard)
  nnoremap <script><buffer> <c-w><c-c> <SID>(gitcommit-discard)
  nnoremap <script><buffer><nowait> dQ <SID>(fugitive-dismiss)

  nnoremap <script> <c-w>o     <SID>(winonly-careful)
  nnoremap <script> <c-w><c-o> <SID>(winonly-careful)
endfunction

function! s:git_reset() abort "{{{3
  let hash = matchstr(getline('.'), '\x\{,6}')
  if empty(hash) | return | endif
  exe 'Git reset' hash
endfunction

function! s:gitcommit_shred() abort "{{{3
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

function! s:winonly_careful() abort "{{{3
  wincmd H
  call s:gitcommit_shred()
  only
  diffoff!
endfunction

function! s:gitcommit_discard() abort "{{{3
  call s:gitcommit_shred()
  quit
endfunction

function! s:fugitive_dismiss() abort "{{{3
  call s:gitcommit_shred()
  WinReduce
  "call win_gotoid(bufwinid('.git/index'))
endfunction
