" Ref: $VIMRUNTIME/ftplugin/gitrebase.vim

let g:no_gitrebase_maps = 1

function! s:choose(word) abort
  " Inspired by /usr/share/nvim/runtime/ftplugin/gitrebase.vim
  let save_view = winsaveview()
  let old_cmd = '^\(\w\+\>\)\=\(\s*\)\ze\x\{4,40\}\>'
  let new_cmd = a:word .' '
  exe 'keeppatterns keepjumps s/'. old_cmd .'/'. new_cmd .'/e'
  call winrestview(save_view)
endfunction

" Excerpt: from a gitrebase file
" p, pick <commit> = use commit
" r, reword <commit> = use commit, but edit the commit message
" e, edit <commit> = use commit, but stop for amending
" s, squash <commit> = use commit, but meld into previous commit
" f, fixup <commit> = like "squash", but discard this commit's log message
" x, exec <command> = run command (the rest of the line) using shell
" b, break = stop here (continue rebase later with 'git rebase --continue')
" d, drop <commit> = remove commit
" l, label <label> = label current HEAD with a name
" t, reset <label> = reset HEAD to a label
" m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
" .       create a merge commit using the original merge commit's
" .       message (or the oneline, if no original merge commit was
" .       specified). Use -c <commit> to reword the commit message.

" Note: prefix-z is used for fold, but it has to be unnecessary on gitrebase.
let g:gitrebase_commander#prefix = get(g:, 'gitrebase_commander#prefix', 'z')
let g:gitrebase_commander#suffixes = get(g:, 'gitrebase_commander#suffixes', {
      \ 'p': 'pick',
      \ 'r': 'reword',
      \ 'e': 'edit',
      \ 's': 'squash',
      \ 'f': 'fixup',
      \ 'x': 'exec',
      \ 'b': 'break',
      \ 'd': 'drop',
      \ 'l': 'label',
      \ 't': 'reset',
      \ 'm': 'merge',
      \ })

function! s:mapping() abort
  let prefix = g:gitrebase_commander#prefix
  let commands = g:gitrebase_commander#suffixes
  for sfx in keys(commands)
    exe 'nnoremap <silent><buffer><nowait>' prefix . sfx
        \ ':<C-u>call <SID>choose(' string(commands[sfx]) ')<CR>'
  endfor
endfunction

call s:mapping()
delfunction s:mapping
