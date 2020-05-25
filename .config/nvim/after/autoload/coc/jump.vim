" function! s:generate_function(destination) abort
"   let dest = tolower(a:destination)
"   function! {'coc#jump#'. dest}(edit) abort closure
"     call CocAction("jump".. a:destination , a:edit)
"   endfunction
" endfunction

" let s:list = ['Definition']

" function! s:generate_functions() abort
"   for dest in s:list
"     call s:generate_function(dest)
"   endfor
" endfunction

" call s:generate_functions()

" Helper Functions {{{1
function! s:set_otherwise(dest) abort
  return has_key(s:args, a:dest)
        \ ? s:otherwise . s:args[a:dest] . expand('<cword>')
        \ : ''
endfunction

function! s:TryCocAction(coc_args, edit, otherwise) abort
  if !CocAction(a:coc_args, a:edit) && !empty(a:otherwise)
    try
      exe a:otherwise expand('<cword>')
    endtry
  endif

  norm! zv
endfunction

" Set Another Commands {{{1
let s:otherwise = ''
let s:args = {}

if exists(':GscopeFind') > 0
  let s:otherwise = 'GscopeFind'
  let s:args = {
        \ 'definition': 'g',
        \ 'symbol': 's',
        \ 'references': 'c',
        \ 'egrep': 'e',
        \ 'include': 'i',
        \ 'assigned': 'a',
        \ }
endif
call map(s:args, '" ". v:val ." "')

" Define Main Functions {{{1
function! coc#jump#definition(edit) abort
  let otherwise = s:set_otherwise('definition')
  call s:TryCocAction('jumpDefinition', a:edit, otherwise)
endfunction

function! coc#jump#type_definition(edit) abort
  let otherwise = s:set_otherwise('type_definition')
  call s:TryCocAction('jumpTypeDefinition', a:edit, otherwise)
endfunction

function! coc#jump#declaration(edit) abort
  let otherwise = s:set_otherwise('declaration')
  call s:TryCocAction('jumpDeclaration', a:edit, otherwise)
endfunction

function! coc#jump#implementation(edit) abort
  let otherwise = s:set_otherwise('implementation')
  call s:TryCocAction('jumpImplementation', a:edit, otherwise)
endfunction

function! coc#jump#references(edit) abort
  let otherwise = s:set_otherwise('references')
  call s:TryCocAction('jumpReferences', a:edit, otherwise)
endfunction
