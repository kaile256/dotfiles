" From: init.vim

set textwidth=79
" set nojoinspaces

" Related sections:
"     fo-table, autoformat
"
" Related options:
"     textwidth, autoindent, formatlistpat
"
" Related commands:
"     gq, join
"

" formatoptions: mostly for 'textwidth', 'autoindent' and so kind.
set formatoptions=

set fo+=1 " Don't break after one-letter word but breaks before the char
set fo+=2 " Ignore indent of the first line of paragraph; requires &autoindent

set fo+=q " Enable 'gq' in Normal mode
" set fo+=a " Enable 'autoformat', which, with 'c' flag, only happens for comments; 'a' without 'c' should not for usual program codes

set fo+=t " Auto-wrap as &textwidth
set fo+=c " Auto-wrap comments as &textwidth with comment leader
" set fo+=w " Paragraph continues with trailing whitespace (affects 'a'); ends with non-space

set fo+=b " Wrap when you enter a blank at/before ...?
set fo+=l " Don't wrap at start insert mode even when over &textwidth

set fo+=n " Break numbered lists as &formatlistpat; requires &autoindent

" set fo+=r " Insert comment leader by \<CR> in Normal mode
" set fo+=o " Insert comment leader by o/O in Normal mode

" set fo+=v " Only break a line at a blank

set fo+=p " Don't break lines at single spaces after '.' (e.g., Mr. Feynman)

set fo+=j " Join lines removing comment leader
set fo+=m " Also break at multi-byte(MB) char
" set fo+=M " Join without spaces around for MB char; overrules 'B'
set fo+=B " Join without a space between two MB char; overrules 'M'

augroup myForceFormatOptions
  if exists('#myForceFormatOptions') | au! myForceFormatOptions
  endif
  au InsertEnter * ++nested silent! set fo-=r fo-=o
  " au InsertEnter * if &conceallevel != 0 && &tw =~# '' | set textwidth=0 | endif
  "au FileType * if getline(1, '$') ==# [] | startinsert | endif
augroup END

" vim: fo-=a
