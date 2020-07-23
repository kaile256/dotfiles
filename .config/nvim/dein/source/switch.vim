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
      \ ['first', 'second', 'third'],
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

let g:switch_custom_definitions += [
      \ {
      \   '\<yes\>': 'no',
      \   '\<no\>': 'yes',
      \ },
      \ ['Yes', 'No'],
      \ ['YES', 'NO'],
      \
      \ ['left', 'right'],
      \ ['Left', 'Right'],
      \
      \ ['height', 'width'],
      \ ['Height', 'Width'],
      \
      \ ['new', 'old'],
      \ ['New', 'Old'],
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
