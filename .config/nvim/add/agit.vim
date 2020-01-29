" From: git.toml
" Repo: cohama/agit.vim

let g:agit_no_default_mappings = 0

command! -bar GlogGlobal :Agit
command! -bar Gl         :Agit
command! -bar Glo        :Agit
command! -bar Glog       :Agit

command! -bar GlogLocal  :AgitFile
command! -bar Gll        :AgitFile

nnoremap <silent> g<a-u> :<c-u>GlocalLog<cr>

" TODO: find the reason for E:modifiable-is-off.
"augroup AgitMyWrapCommands
"  au!
"  au FileType agit      call <SID>agit_commands() | <SID>agit_keymaps()
"  au FileType agit_diff call <SID>diff_commands() | <SID>agit_keymaps()
"  au FileType agit_stat call <SID>stat_commands() | <SID>agit_keymaps()
"augroup END

function! s:agit_commands() abort
  command! -buffer -bar GbisectStart :AgitGit bisect start HEAD <hash> \%#

  let agit_cmds = {
        \ 'bisectBad':         'AgitGit bisect bad',
        \ 'bisectGood':        'AgitGit bisect good',
        \ 'bisectReset':       'AgitGit bisect reset',
        \ 'rebase':            'AgitGitConfirm rebase',
        \ 'rebaseInteractive': 'AgitGitConfirm! rebase --interactive',
        \ 'reset':             'AgitGitConfirm reset',
        \ 'resetHard':         'AgitGitConfirm reset --hard',
        \ 'resetSoft':         'AgitGitConfirm reset --soft',
        \ 'revert':            'AgitGit revertgood',
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
  " stat: how changed
  nmap <buffer> <c-j> <Plug>(agit-scrolldown-stat)
  nmap <buffer> <c-k> <Plug>(agit-scrollup-stat)
  nmap <buffer> <c-j> <Plug>(agit-scrolldown-diff)
  nmap <buffer> <c-k> <Plug>(agit-scrollup-diff)

  nmap <buffer> gC <Plug>(agit-show-commit)

  nmap <buffer> y# <PLug>(agit-yank-hash)
  nmap <buffer> di <Plug>(agit-diff)
  nmap <buffer> dl <Plug>(agit-diff-with-local)
  "nmap <buffer> <c-g> <Plug>(agit-print-commitmsg)

  nmap <buffer> co <Plug>(agit-git-checkout)
  " checkout -b: create a new branch to checkout
  nmap <buffer> cO <Plug>(agit-git-checkout-b)
  nmap <buffer> D <Plug>(agit-git-branch-d)

  "nmap <buffer> rv <Plug>(agit-git-revert)
  "nmap <buffer> rs <Plug>(agit-git-reset-soft)
  "nmap <buffer> rS <Plug>(agit-git-reset)
  "nmap <buffer> rH <Plug>(agit-git-reset-hard)
  "nmap <buffer> rB <Plug>(agit-git-rebase)
  "nmap <buffer> rb <Plug>(agit-git-rebase-i)
  "nmap <buffer> rs <Plug>(agit-git-bisect-start)
  "nmap <buffer> rg <Plug>(agit-git-bisect-good)
  "nmap <buffer> rb <Plug>(agit-git-bisect-bad)
  "nmap <buffer> rs <Plug>(agit-git-bisect-reset)

  "nmap <buffer>  <Plug>(agit-git-cherry-pick)
  " Note: use :tabclose
  nmap <buffer> <c-w>C <Plug>(agit-exit)
endfunction
