" From: git.toml
" Repo: cohama/agit.vim
" Another: add/agit.vim

let g:agit_no_default_mappings = 1
" auto refresh on BufEnter
let g:agit_enable_auto_refresh = 1

"let g:agit_stat_location = 'topleft' " hopefully

hi! link agitDiffAdd diffAdded
hi! link agitDiffRemove diffRemoved

augroup myAgitSo
  "au FileType agit call s:agit_commands()
  au FileType agit* call s:agit_common_keymaps()
  au FileType agit  call s:agit_keymaps()
  au FileType agit_stat call s:agit_stat_keymaps()
  au CursorMoved agit call s:modify_foldlevel()
augroup END

"function! s:agit_commands() abort "{{{1
"  command! -buffer -bar AgitBisectStart :AgitGit bisect start HEAD <hash> \%#
"
"  let agit_cmds = {
"        \ 'BisectBad':         'AgitGit bisect bad',
"        \ 'BisectGood':        'AgitGit bisect good',
"        \ 'BisectReset':       'AgitGit bisect reset',
"        \
"        \ 'Rebase':            'AgitGitConfirm rebase',
"        \ 'RebaseInteractive': 'AgitGitConfirm! rebase --interactive',
"        \
"        \ 'Reset':             'AgitGitConfirm reset',
"        \ 'ResetHard':         'AgitGitConfirm reset --hard',
"        \ 'ResetSoft':         'AgitGitConfirm reset --soft',
"        \
"        \ 'Revert':            'AgitGit revert',
"        \ }
"
"  for cmd in keys(agit_cmds)
"    exe 'command! -buffer -bar Agit'. cmd ':'. agit_cmds[cmd]
"  endfor
"endfunction

" TODO: show diff w/ uncommited buffer.
"       1. :AgitFile, setl winfixwidth
"       2. open the uncommited buffer to the end

function! s:agit_common_keymaps() abort "{{{1
  nmap <buffer> U <Plug>(agit-reload)

  nnoremap <silent><buffer> zr :<C-u>call <SID>agit_fold('r')<CR>
  nnoremap <silent><buffer> zR :<C-u>call <SID>agit_fold('R')<CR>
  nnoremap <silent><buffer> zm :<C-u>call <SID>agit_fold('m')<CR>
  nnoremap <silent><buffer> zM :<C-u>call <SID>agit_fold('M')<CR>
endfunction

function! s:agit_fold(arg) abort "{{{1
  let save_winID = win_getid()
  let diff_winID = win_getid(bufwinnr('\[Agit diff]'))
  call win_gotoid(diff_winID)
  exe 'norm! z'. a:arg
  call win_gotoid(save_winID)
endfunction

function! s:agit_stat_keymaps() abort "{{{1
  " Ref: cohama/agit.vim/autoload/agit/view/stat.vim
  nmap <buffer> di <Plug>(agit-diff)
  nmap <buffer> dl <Plug>(agit-diff-with-local)
endfunction

function! s:agit_keymaps() abort "{{{1
  " Ref: cohama/agit.vim/autoload/agit/view/log.vim
  "nmap <buffer> gC <Plug>(agit-show-commit)

  nmap <buffer> y# <PLug>(agit-yank-hash)

  nmap <buffer> <C-g> <Plug>(agit-print-commitmsg)

  " deletes the branch under cursor
  nmap <buffer> dD <Plug>(agit-git-branch-d)
  "" checks out to the branch under cursor
  "nmap <buffer> co <Plug>(agit-git-checkout)
  " checkout -b: create a new branch to checkout
  "   the default name is the hash under cursor
  nmap <buffer> co <Plug>(agit-git-checkout-b)

  " revert to the commit under cursor
  nmap <buffer> rv <Plug>(agit-git-revert)

  " reset to the commit under cursor
  nmap <buffer> rs <Plug>(agit-git-reset-soft)
  nmap <buffer> rh <Plug>(agit-git-reset-hard)
  " reset --mixed
  nmap <buffer> rm <Plug>(agit-git-reset)

  " rebase HEAD to the commit under cursor in the keymaps
  "nmap <buffer> R <Plug>(agit-git-rebase)
  nmap <buffer> ri <plug>(agit-git-rebase-i)

  "nmap <buffer> rs <Plug>(agit-git-bisect-start)
  "nmap <buffer> rg <Plug>(agit-git-bisect-good)
  "nmap <buffer> rb <Plug>(agit-git-bisect-bad)
  "nmap <buffer> rs <Plug>(agit-git-bisect-reset)

  nmap <buffer> cp <Plug>(agit-git-cherry-pick)

  "nmap <buffer> <c-w>C <Plug>(agit-exit)

  " Scroll {{{2
  nnoremap <buffer> d <c-d>
  nnoremap <buffer> u <c-u>
  nnoremap <buffer> D <c-f>
  nnoremap <buffer> U <c-b>

  xnoremap <buffer> d <c-d>
  xnoremap <buffer> u <c-u>
  xnoremap <buffer> D <c-f>
  xnoremap <buffer> U <c-b>

  " Remote Scroll {{{2
  " <Plug>(agit-scrolldown/up-foo) scroll from another window in remote
  nmap <buffer> <c-n> <Plug>(agit-scrolldown-stat)
  nmap <buffer> <c-p> <Plug>(agit-scrollup-stat)

  nmap <buffer> <c-j> <Plug>(agit-scrolldown-diff)
  nmap <buffer> <c-k> <Plug>(agit-scrollup-diff)

  "}}}2
endfunction

function! s:modify_foldlevel() abort "{{{1
  " FIXME: make it work
  let save_id = win_getid()
  let id_diff = win_getid(bufwinnr('\[Agit diff] '))
  call win_gotoid(id_diff)

  let file_compared = '^diff --git a/'
  let lines_compared = '^@@.*@@'
  let s:appears_once = {pat -> search(pat, 'ncw') == search(pat, 'ncwb')}
  setl fdl=1

  call win_gotoid(save_id)
endfunction
