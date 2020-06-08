" Helper Functions {{{1
function! s:set_otherwise(open, dest) abort
  return has_key(s:args, a:dest)
        \ ? s:otherwise[a:open] . s:args[a:dest] . expand('<cword>')
        \ : ''
endfunction

function! s:TryCocAction(coc_args, edit, otherwise) abort
  let cur_winnr = winnr()
  let cur_line = line('.')
  " Note: for 'zv', not in Async
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
    exe "norm! 5\<C-y>"
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

" function! my#jump#init() abort
"   for where in [
"        \ 'Definition',
"        \ 'TypeDefinition',
"        \ 'Declaration',
"        \ 'Implementation',
"        \ 'References',
"        \ ]

"     let lower = tolower(where)
"     function! my#jump#{lower}(open) abort
"       let otherwise = s:set_otherwise(a:open, lower)
"       call s:TryCocAction('jump'. where, a:open, otherwise)
"     endfunction
"   endfor
" endfunction

function! my#jump#definition(open) abort
  let otherwise = s:set_otherwise(a:open, 'definition')
  call s:TryCocAction('jumpDefinition', a:open, otherwise)
endfunction

function! my#jump#type_definition(open) abort
  let otherwise = s:set_otherwise(a:open, 'type_definition')
  call s:TryCocAction('jumpTypeDefinition', a:open, otherwise)
endfunction

function! my#jump#declaration(open) abort
  let otherwise = s:set_otherwise(a:open, 'declaration')
  call s:TryCocAction('jumpDeclaration', a:open, otherwise)
endfunction

function! my#jump#implementation(open) abort
  let otherwise = s:set_otherwise(a:open, 'implementation')
  call s:TryCocAction('jumpImplementation', a:open, otherwise)
endfunction

function! my#jump#references(open) abort
  let otherwise = s:set_otherwise(a:open, 'references')
  call s:TryCocAction('jumpReferences', a:open, otherwise)
endfunction
