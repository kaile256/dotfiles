let s:docker_words = []

let s:docker_words += [
      \ 'from',
      \ 'maintainer',
      \ 'env',
      \ 'path',
      \ 'run',
      \ 'entrypoint',
      \ 'expose',
      \ ]

let s:in_comment = {line, col ->
      \ synIDattr(synIDtrans(synID(line, col - 1, 0)), 'name') =~? 'Comment\|String'
      \ }

function! s:uppercase_keywords(word) abort
  " Do not uppercase word if within a comment or string
  exe 'inoreabbrev <expr><buffer>' a:word
        \ s:in_comment(line('.'), col('.'))
        \   ? string(a:word)
        \   : string(toupper(a:word))
endfunction

for word in uniq(s:docker_words)
  call s:uppercase_keywords(word)
endfor

unlet s:docker_words
delfunction s:uppercase_keywords
