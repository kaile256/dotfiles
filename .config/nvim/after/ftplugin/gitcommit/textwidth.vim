hi def link FtGitCommitSubjectWidth gitCommitOverflow

let s:namespace = nvim_create_namespace('ft/gitcommit/textwidth')
let s:max_subject_width = 50
function! s:hi_overflow_column() abort
  const filled = len(getline(1))
  if filled > s:max_subject_width - 1 | return | endif
  " Add `1` for a space preceded by virtual text.
  const hi_col = s:max_subject_width - filled + 1
  " We cannot highlight on no-character position.
  const chunks = [
        \ [repeat(' ', hi_col - 1)],
        \ [' ', 'FtGitCommitSubjectWidth']
        \ ]
  call nvim_buf_set_virtual_text(0, s:namespace, 0, chunks, {})
endfunction

augroup myFt/Gitcommit/ShowMaxSubjectWidth
  au!
  " Note: TextChangedP invokes with a little delay to clear virtualtext; on the
  " other hand, InsertCharPre is fairly fast lest virtualtext wavers, yet it
  " blinks.
  " FIXME: Do not call nvim_buf_clear_namespace() on starting a new line. The
  " workaround with v:char detection sometimes doesn't work up to <CR> mapping.
  au InsertCharPre,CompleteChanged <buffer>
        \ if line('.') == 1 && v:char !=# ""
        \ | call nvim_buf_clear_namespace(0, s:namespace, 0, 1)
        \ | endif
  au TextChanged,TextChangedI,TextChangedP,CompleteChanged <buffer>
        \ if line('.') == 1
        \ | call s:hi_overflow_column()
        \ | endif
augroup END
call s:hi_overflow_column()
