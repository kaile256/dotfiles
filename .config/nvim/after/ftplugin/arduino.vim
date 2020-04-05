let s:keywords = [
      \ 'input',
      \ 'output',
      \ 'high',
      \ 'low',
      \ ]

function! s:uppercase_keywords(word) abort
  " Do not uppercase word if within a comment or string
  if synIDattr(synIDtrans(synID(line('.'), col('.') - 1, 0)), 'name')
        \ =~# 'Comment\|String'
    return
  else
    exe 'inoreabbrev <buffer>' tolower(a:word) toupper(a:word)
  endif
endfunction

for word in uniq(s:keywords)
  call s:uppercase_keywords(word)
endfor

unlet s:keywords
delfunction s:uppercase_keywords

