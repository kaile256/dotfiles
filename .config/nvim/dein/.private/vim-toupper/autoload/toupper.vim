function! toupper#buflocal(words) abort
  for word in uniq(a:words)
    call s:toupper(word, '<buffer>')
  endfor
endfunction

function! s:toupper(word, map_args) abort
  " Do not uppercase word if within a comment or string
  exe 'inoreabbrev' a:map_args a:word '<C-r>=<SID>upper_or_keep(' string(a:word) ')<CR>'
endfunction

function! s:upper_or_keep(word) abort
  return s:in_comment(line('.'), col('.') - 1)
        \ ? a:word
        \ : toupper(a:word)
endfunction

function! s:in_comment(line, col) abort
  let syn = synIDattr(synIDtrans(synID(a:line, a:col, 0)), 'name')
  return syn =~? 'Comment\|String'
endfunction

