
hi! link snipLeadingSpaces NonText

" try
"   let s:filetype = expand('%:t:r')
"   exe 'syntax include @'. s:filetype 'syntax/'. s:filetype .'.vim'
"   unlet b:current_syntax
" catch /E403\|E169\|E108/
"   " Both E169 and E108 is especially for 'snippets.snippets'
" finally
"   " unlet s:filetype
" endtry
