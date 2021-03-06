" From: git.toml
" Repo: tpope/vim-fugitive
" Another: add/fugitive.vim

let g:fugitive_no_maps = 1 " true: disable mappings to `y<C-g>` and `<C-r><C-g>`

augroup myFugitiveRememberTheLastBuffer
  let s:save_winid = -1
  au FileType fugitive,gitcommit
        \ if getwinvar(winnr('#'), '&ft') !~# 'fugitive\|gitcommit'
        \ | let s:save_winid = win_getid(winnr('#')) | endif
  au BufWinLeave .git/{index,COMMIT_EDITMSG} call win_gotoid(s:save_winid)
augroup END

augroup myFugitiveSo
  au FileTYpe git,fugitive call s:unmap()
  au FileType fugitive  call s:fugitive_keymap()
  au FileType gitcommit call s:gitcommit_keymap()

  au FileType fugitive,fugitiveblame setl nonumber signcolumn= bufhidden=wipe
  au BufRead fugitive:///* setl buftype=nofile
augroup END

" Define Functions for autocmds {{{1
" Define Keymaps on Buffer {{{2
function! s:unmap() abort
  silent! unmap <buffer> J
  silent! unmap <buffer> K
  silent! unmap <buffer> *
  silent! unmap <buffer> #
endfunction

function! s:fugitive_keymap() abort "{{{3
  " Note: for fugitive-buffer, not for &diff
  noremap <buffer> j j
  noremap <buffer> k k

  " especially for the case ':norm U' to unstage all
  nnoremap <buffer><silent> <SID>(fugitive:gstage-prev-window)
        \ :<c-u>wincmd p <bar> Gw <bar> wincmd p <bar>
        \ call feedkeys('gszz')<cr>
  nnoremap <script><buffer> S <SID>(fugitive:gstage-prev-window)

  nnoremap <buffer><silent> <SID>(fugitive:diff-to-HEAD)
        \ :<c-u>wincmd p <bar> Gw <bar> GwToDiff HEAD <bar> Gvstatus<cr>
  nnoremap <script><buffer> D <SID>(fugitive:diff-to-HEAD)

  " To: continue to cc/ce/ca.
  xnoremap <buffer> c sc
  nnoremap <silent><buffer> R :<C-u>call <SID>git_reset()<CR>
  " Mnemonic: Commit Everything (cA is predefined to squash! and edit the msg)
  nnoremap <silent><buffer> cE :<C-u>call <SID>commit_all()<CR>

  " raw mappings without <space> would be recursive mappings inside the func.
  nnoremap <silent><buffer> <space>ri :<C-u>call <SID>git_rebase('i')<CR>
  nnoremap <silent><buffer> <space>rd :<C-u>call <SID>git_rebase('d')<CR>
  nnoremap <silent><buffer> <space>re :<C-u>call <SID>git_rebase('e')<CR>
  nnoremap <silent><buffer> <space>rw :<C-u>call <SID>git_rebase('w')<CR>
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

function! s:git_rebase(key) abort "{{{3
  if s:commit_all()
    let Rebase = 'norm r'. a:key
    exe Rebase
  else
    echo 'Abort git-rebase'
  endif
endfunction

function! s:commit_all(...) abort "{{{3
  let save_view = winsaveview()
  let hash_on_cursor = matchstr(getline('.'), '^\x\{6,}\ze ')
  Git add --all

  let has_uncommitted = search('^Staged (\d\+)$', 'wn') > 0
  if has_uncommitted
    let branch = FugitiveHead()
    let is_confirmed = input('Commit all the files at "'. branch .'"? y[es]/n[o]: ')
    if is_confirmed !~? 'y\%[es]'
      echon "\nAbort git-commit"
      let Unstage_all = 'norm U'
      exe Unstage_all
      call winrestview(save_view)
      return 0
    endif
  endif

  let msg = a:0 > 0 ? a:1 : '[TMP] RESET to HEAD^ after all'
  exe 'Git commit -m "' msg '"'

  let Go_to_Unpushed_section = 'norm gp'
  exe Go_to_Unpushed_section

  if hash_on_cursor !=# ''
    call search(hash_on_cursor, 'Wc')
  endif

  " Note: winrestview() here is meaningless because lines made of lists of
  " uncommited files/directories will disappear after committing.
  return 1
endfunction

function! s:git_reset() abort "{{{3
  let hash = matchstr(getline('.'), '\x\{,6}')
  if empty(hash) | return | endif

  let is_confirmed = input('Git Reset to '. hash .'? y[es]/n[o]: ')
  if is_confirmed !~? 'y\%[es]'
    echo 'Abort git-reset at' hash
    return
  endif

  " call s:commit_all()

  exe 'Git reset' hash

  " Make sure the cursor on 'git-status' for the use out of 'git-status'.
  " TODO: Update all 'git-status' in current tab.
  let winid = bufwinid('\.git/index')
  if winid == -1 | return | endif
  call win_gotoid(winid)

  " Update index
  e!
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
