" From: tool.toml

if g:RenamerSupportColonWToRename
  nnoremap <buffer> <silent> l :call renamer#ChangeDirectory()<CR>
  nnoremap <buffer> <silent> z. :call renamer#ToggleShowHidden()<CR>
  nnoremap <buffer> <silent> D :call renamer#DeleteEntry()<CR>"}}}
endif
