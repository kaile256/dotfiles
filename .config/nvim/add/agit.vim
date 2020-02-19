" From: git.toml
" Repo: cohama/agit.vim

let g:agit_no_default_mappings = 1

command! -bar GlogGlobal :Agit
command! -bar Gl         :Agit
command! -bar Glo        :Agit
command! -bar Glog       :Agit

command! -bar GlogLocal  :AgitFile
command! -bar Gll        :AgitFile

nnoremap <silent> g<a-u> :<c-u>GlocalLog<cr>

augroup myAgitAdd
  au!
  au FileType agit,agit_diff,agit_stat call <SID>agit_commands()
  au FileType agit,agit_diff,agit_stat call <SID>agit_keymaps()
augroup END

function! s:agit_commands() abort
  command! -buffer -bar GbisectStart :AgitGit bisect start HEAD <hash> \%#

  let agit_cmds = {
        \ 'BisectBad':         'AgitGit bisect bad',
        \ 'BisectGood':        'AgitGit bisect good',
        \ 'BisectReset':       'AgitGit bisect reset',
        \ 'Rebase':            'AgitGitConfirm rebase',
        \ 'RebaseInteractive': 'AgitGitConfirm! rebase --interactive',
        \ 'Reset':             'AgitGitConfirm reset',
        \ 'ResetHard':         'AgitGitConfirm reset --hard',
        \ 'ResetSoft':         'AgitGitConfirm reset --soft',
        \ 'Revert':            'AgitGit revert',
        \ }

  for cmd in keys(agit_cmds)
    exe 'command! -buffer -bar Agit'. cmd ':'. agit_cmds[cmd] '<hash>'
  endfor
endfunction

" TODO: show diff w/ uncommited buffer.
"       1. :AgitFile, setl winfixwidth
"       2. open the uncommited buffer to the end

function! s:agit_keymaps() abort "{{{1
  "nmap <buffer> u <Plug>(agit-reload)

  nmap <buffer> gC <Plug>(agit-show-commit)

  nmap <buffer> y# <PLug>(agit-yank-hash)
  nmap <buffer> di <Plug>(agit-diff)
  nmap <buffer> dl <Plug>(agit-diff-with-local)
  "nmap <buffer> <c-g> <Plug>(agit-print-commitmsg)

  "" deletes the branch under cursor
  "nmap <buffer> D <Plug>(agit-git-branch-d)
  "" checks out to the branch under cursor
  "nmap <buffer> co <Plug>(agit-git-checkout)
  "" checkout -b: create a new branch to checkout
  ""   the default name is the hash under cursor
  "nmap <buffer> cO <Plug>(agit-git-checkout-b)

  nmap <buffer> dd <Plug>(agit-git-revert)
  nmap <buffer> D  <Plug>(agit-git-revert)

  "nmap <buffer> rs <Plug>(agit-git-reset-soft)
  "nmap <buffer> rS <Plug>(agit-git-reset)
  "nmap <buffer> rH <Plug>(agit-git-reset-hard)

  nmap <buffer> R <Plug>(agit-git-rebase)
  xmap <buffer> R <Plug>(agit-git-rebase)
  "nmap <buffer> R <Plug>(agit-git-rebase-i)

  "nmap <buffer> rs <Plug>(agit-git-bisect-start)
  "nmap <buffer> rg <Plug>(agit-git-bisect-good)
  "nmap <buffer> rb <Plug>(agit-git-bisect-bad)
  "nmap <buffer> rs <Plug>(agit-git-bisect-reset)

  "nmap <buffer>  <Plug>(agit-git-cherry-pick)

  "nmap <buffer> <c-w>C <Plug>(agit-exit)

  nnoremap <buffer> d <c-d>
  nnoremap <buffer> u <c-u>
  nnoremap <buffer> D <c-f>
  nnoremap <buffer> U <c-b>

  " Remote Scroll {{{2
  " <Plug>(agit-scrolldown/up-foo) scroll from another window in remote
  nmap <buffer> <c-n> <Plug>(agit-scrolldown-stat)
  nmap <buffer> <c-p> <Plug>(agit-scrollup-stat)

  nmap <buffer> <c-j> <Plug>(agit-scrolldown-diff)
  nmap <buffer> <c-k> <Plug>(agit-scrollup-diff)

  "}}}2
endfunction
