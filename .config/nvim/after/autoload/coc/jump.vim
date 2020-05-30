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
function! s:set_otherwise(open, dest) abort
  return has_key(s:args, a:dest)
        \ ? s:otherwise[a:open] . s:args[a:dest] . expand('<cword>')
        \ : ''
endfunction

function! s:TryCocAction(coc_args, edit, otherwise) abort
  let cur_winnr = winnr()
  let cur_line = line('.')
  if !CocAction(a:coc_args, a:edit) && !empty(a:otherwise)
    try
      exe a:otherwise
    catch
      try
        echo 'Generating GTags...'
        GenGTAGS
        exe a:otherwise
      endtry
    endtry
  endif

  if winnr() != cur_winnr || line('.') != cur_line
    norm! zt
  endif
  norm! zv
endfunction

" Set Another Commands {{{1
let s:otherwise = {
      \ 'edit': 'cs find',
      \ 'split': 'scs find',
      \ 'vsplit': 'vert scs find',
      \ 'tabe': 'tab scs find',
      \ }

let s:args = {
      \ 'symbol': 's',
      \ 'definition': 'g',
      \ 'called': 'd',
      \ 'references': 'c',
      \ 'string': 't',
      \ 'egrep': 'e',
      \ 'file': 'f',
      \ 'include': 'i',
      \ 'assigned': 'a',
      \ }

call map(s:args, '" ". v:val ." "')

" Define Main Functions {{{1
function! coc#jump#definition(open) abort
  let otherwise = s:set_otherwise(a:open, 'definition')
  call s:TryCocAction('jumpDefinition', a:open, otherwise)
endfunction

function! coc#jump#type_definition(open) abort
  let otherwise = s:set_otherwise(a:open, 'type_definition')
  call s:TryCocAction('jumpTypeDefinition', a:open, otherwise)
endfunction

function! coc#jump#declaration(open) abort
  let otherwise = s:set_otherwise(a:open, 'declaration')
  call s:TryCocAction('jumpDeclaration', a:open, otherwise)
endfunction

function! coc#jump#implementation(open) abort
  let otherwise = s:set_otherwise(a:open, 'implementation')
  call s:TryCocAction('jumpImplementation', a:open, otherwise)
endfunction

function! coc#jump#references(open) abort
  let otherwise = s:set_otherwise(a:open, 'references')
  call s:TryCocAction('jumpReferences', a:open, otherwise)
endfunction
