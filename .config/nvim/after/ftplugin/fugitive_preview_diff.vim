
augroup myPreviewGitDiffFtplugin
  if exists('#myPreviewGitDiffFtplugin') | au! myPreviewGitDiffFtplugin
  endif
  au CursorMoved fugitive,gitrebase call s:preview_gdiff()
augroup END

function! s:preview_gdiff() abort
  let buflist = tabpagebuflist()
  if s:has_another_win(buflist) | return | endif

  let hash = matchstr(getline('.'), '\x\{6,}')
  if len(hash) > 0
    exe 'vert Gpedit' hash
  endif
endfunction

let s:has_another_win = {buflist
      \ -> (len(buflist) > 3)
      \ || (len(buflist) == 2 && getbufvar(buflist[1], '&previewwindow') == 0)
      \ }
