let s:group = 'rellines'

function! rellines#sign#enable() abort
  call s:set_signs()
endfunction

function! s:parse_match() abort
  let words = split(b:match_words, ',')
endfunction

function! s:set_signs(name, lines) abort
  let bufnr = bufnr('%')
  for lnum in a:lines
    call s:set_sign(name, bufnr, lnum)
  endfor
endfunction

function! s:set_sign(name, bufnr, lnum) abort
  call sign_place(s:sign_id(), s:group, a:name, a:bufnr, {'lnum': a:lnum})
endfunction

function!  s:set_signs_as_match() abort
  b:match_words
endfunction

function! s:sign_id() abort
  if !exists('s:sign_id')
    let s:sign_id = 0
  endif
  let s:sign_id += 1
  return s:sign_id
endfunction

function! s:define_sign_text() abort
  exe 'sign define RelLinesHead text=' . g:rellines_sign_head
  exe 'sign define RelLinesBody text=' . g:rellines_sign_body
  exe 'sign define RelLinesTail text=' . g:rellines_sign_tail
endfunction

function! s:define_sign_text_highlights() abort
  " Once a sign's text attribute has been defined, it cannot be undefined or
  " set to an empty value.  So to make signs' text disappear (when toggling
  " off or disabling) we make them invisible by setting their foreground colours
  " to the background's.
  if g:rellines_signs
    sign define RelLinesHead texthl=RelLinesHead
    sign define RelLinesBody texthl=RelLinesBody
    sign define RelLinesTail texthl=RelLinesTail
  else
    sign define RelLinesHead texthl=RelLinesHeadInvisible
    sign define RelLinesBody texthl=RelLinesBodyInvisible
    sign define RelLinesTail texthl=RelLinesTailInvisible
  endif
endfunction

function! s:remove_signs(bufnr) abort
  if exists('*sign_unplace')
    call sign_unplace(s:group, {'buffer': a:bufnr})
    return
  endif
endfunction
