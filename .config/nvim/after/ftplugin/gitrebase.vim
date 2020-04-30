
augroup myGitrebaseFtplugin
  if exists('#myGitrebaseFtplugin') | au! myGitrebaseFtplugin
  endif
  au CursorMoved gitrebase call s:preview_gdiff()
augroup END

function! s:preview_gdiff() abort
  let hash = matchstr(getline('.'), '^[^#]\S\+\s\+\zs\S\+')
  exe 'vert Gpedit' hash
endfunction
