" TOML: operator.toml
" Repo: AndrewRadev/switch.vim
" Another: add/switch.vim

"let g:switch_find_smallest_match = 0

" override to suppress default one
let g:switch_mapping = ''
" let g:switch_reverse_mapping = ''

" Excerpt: Regexp support in Dictionary, {'if_matched': 'then_this_one'}, e.g.,
" let b:switch_custom_definitions = [{
"     \ '<div\(.\{-}\)>\(.\{-}\)</div>':   '<span\1>\2</span>',
"     \ '<span\(.\{-}\)>\(.\{-}\)</span>': '<div\1>\2</div>',
"     \ }]

let g:switch_custom_definitions = []

let g:switch_custom_definitions += [
      \ ['should', 'must'],
      \ ['could', 'would'],
      \ ]

let g:switch_custom_definitions += [
      \ ['horizontal', 'vertical'],
      \ ['Enter', 'Leave'],
      \ {
      \   '\<on\>': 'off',
      \   '\<off\>': 'on',
      \ },
      \ ]

let g:switch_custom_definitions += [
      \ [
      \   'foo',   'bar',    'baz',    'qux', 'quux',
      \   'corge', 'grault', 'garply', 'waldo',
      \   'fred',  'plugh',  'xyzzy',  'thud'
      \ ],
      \
      \ ['1st', '2nd', '3rd', '4th'],
      \
      \ [' + ', ' - '],
      \
      \ ['==', '!='],
      \ ['first', 'second', 'third', 'last'],
      \
      \ ['before', 'after'],
      \
      \ ['collapse', 'expand'],
      \
      \ ['allow', 'deny'],
      \ ['accept', 'refuse'],
      \
      \ ['host', 'guest'],
      \
      \ ['begin', 'end'],
      \ ['start', 'stop'],
      \ ['forward', 'backward'],
      \
      \ ['enqueue', 'dequeue'],
      \
      \ ['private', 'public'],
      \
      \ ['path', 'dir', 'file'],
      \ ]

let g:switch_custom_definitions += [
      \ {
      \   '++\(\h\w*\)': '\1++',
      \   '--\(\h\w*\)': '\1--',
      \
      \   '\(\h\w*\)++': '\1--',
      \   '\(\h\w*\)--': '\1++',
      \ },
      \ ]

" FIXME: get correct match pair to move `while (cond)`.
let s:pat_while = '\(while (.*)\) \({\(.*\n\)\{-}\s*}\)'
let s:pat_do_while = 'do \({\(.*\n\)\{-}\s*}\) \(while (.*)\);'
let g:switch_custom_definitions += [
      \ {
      \   s:pat_while : 'do \2 \1;',
      \   s:pat_do_while : '\3 \1',
      \ },
      \ ]
unlet s:pat_while s:pat_do_while

let g:switch_custom_definitions += [
      \ {
      \   '\<yes\>': 'no',
      \   '\<no\>': 'yes',
      \ },
      \ ['Yes', 'No'],
      \ ['YES', 'NO'],
      \
      \ ['disable', 'enable'],
      \ ['Disable', 'Enable'],
      \
      \ ['left', 'right'],
      \ ['Left', 'Right'],
      \
      \ {
      \   '\<row\>': 'col',
      \   '\<col\>': 'row',
      \ }
      \
      \ ['height', 'width'],
      \ ['Height', 'Width'],
      \
      \ ['new', 'old'],
      \ ['New', 'Old'],
      \
      \ ['above', 'below'],
      \ ['Above', 'Below'],
      \
      \ ['up', 'down'],
      \ ['Up', 'Down'],
      \
      \ ['next', 'prev'],
      \ ['Next', 'Prev'],
      \
      \ ['lower', 'upper'],
      \ ['earlier', 'later'],
      \
      \ ['inc', 'dec'],
      \ ['decrement', 'increment'],
      \ ]

let g:switch_custom_definitions += [
      \ ['javascript', 'typescript']
      \ ]

let g:switch_custom_definitions += [
      \ ['右', '左'],
      \ ]
