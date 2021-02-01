" RUNTIME: $VIMRUNTIME/ftplugin/gitcommit.vim
" After: after/ftplugin/gitcommit/

function! s:detect_commit_type() abort
  const first_non_blank_line = getline(nextnonblank(1))

  const pat_new_commit = '^\s*# Please enter the commit message'

  const pats_conflicted_msg = [
        \ '# This is the 1st commit message:',
        \ '# This is the commit message #\d\+:',
        \ ]
  const pat_conflicted_msg = '\%('. join(pats_conflicted_msg, '\|') .'\)'

  function! s:is_editing_new_commit() abort closure
    return first_non_blank_line =~# pat_new_commit
  endfunction

  function! s:is_conflicted() abort closure
    const has_conflicted_msg = search(pat_conflicted_msg, 'wn')
    return has_conflicted_msg
  endfunction

  function! s:is_amending_commit() abort closure
    const pat_commit_description = '^[^#]\+'
    return first_non_blank_line =~# pat_commit_description
  endfunction

  let commit_type =
        \   s:is_editing_new_commit() ? 'new'
        \ : s:is_conflicted() ? 'conflicted'
        \ : s:is_amending_commit() ? 'amend'
        \ : 'undefined'
  return commit_type
endfunction

let b:gitcommit_type = s:detect_commit_type()
delfunction s:detect_commit_type

