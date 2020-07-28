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

" Note: prefix-z is used for fold, but it has to be unnecessary on gitrebase.
nnoremap <silent><buffer><nowait> zp :<C-u>call <SID>choose('pick')<CR>
nnoremap <silent><buffer><nowait> zr :<C-u>call <SID>choose('reword')<CR>
nnoremap <silent><buffer><nowait> ze :<C-u>call <SID>choose('edit')<CR>
nnoremap <silent><buffer><nowait> zs :<C-u>call <SID>choose('squash')<CR>
nnoremap <silent><buffer><nowait> zf :<C-u>call <SID>choose('fixup')<CR>
nnoremap <silent><buffer><nowait> zx :<C-u>call <SID>choose('exec')<CR>
nnoremap <silent><buffer><nowait> zb :<C-u>call <SID>choose('break')<CR>
nnoremap <silent><buffer><nowait> zd :<C-u>call <SID>choose('drop')<CR>
nnoremap <silent><buffer><nowait> zb :<C-u>call <SID>choose('label')<CR>
nnoremap <silent><buffer><nowait> zt :<C-u>call <SID>choose('reset')<CR>
nnoremap <silent><buffer><nowait> zm :<C-u>call <SID>choose('merge')<CR>

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
