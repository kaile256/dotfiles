" if !g:neosnippet#enable_default_fold
"   finish
" endif

setlocal foldmethod=expr foldexpr=NeosnippetFoldexpr()

if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
else
    let b:undo_ftplugin = '|'
endif

let b:undo_ftplugin .= '
    \ setlocal foldmethod< foldexpr<
    \'

if exists('*NeosnippetFoldexpr')
  finish
endif

function! NeosnippetFoldexpr() abort
  if getline(v:lnum) =~? '^snippet'
    " Though '^snippet\s\+[^ \t]' in case sensitive comparison seems better,
    " the adopted loose one could help users to find some possible errors in
    " the syntax of neosnippet; otherwise, such errors would be hidden in
    " another fold.
    return '>1'
  endif

  return '='
endfunction
