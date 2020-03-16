"""" From: filetype.toml
""""  Ref: org-mode.vimrc
""""  Ref: ultisnips.vimrc


augroup SyntaxInclude
  au!
  au FileType snippets call s:included_syntax_ultisnippets()
  au FileType neosnippets call s:included_syntax_neosnippets()
  au FileType org call s:included_syntax_org()
augroup END

function! s:included_syntax_ultisnippets()
  call SyntaxRange#Include('snippet', 'endsnippet', 'vim') 
endfunction

function! s:included_syntax_neosnippets()
  call SyntaxRange#Include('snippets', 'endsnippets', 'vim') 
endfunction

function! s:included_syntax_org()
  call SyntaxRange#Include('#+begin_src', '#+end_src', 'vim') 
endfunction
